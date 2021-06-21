class StudentsController < ApplicationController

  before_action :set_student, only: %i[ show edit update destroy ]
  include ComboBoxHelper
  include StudentsHelper
  include Deleteable
  include Icons


  def index
    show_icons
    @search = params[:fullname] || ""
    @students = Student.where("(LOWER(name) like LOWER(?) OR LOWER(last_name) like LOWER(?) OR LOWER(identification) like LOWER(?)) " ,"%#{@search}%","%#{@search}%","%#{@search}%")
                    .order('last_name').paginate(page: params[:page], per_page: 30).order('id desc')
  end

  # GET /students/1 or /students/1.json
  def show
    show_leader
  end

  # GET /students/new
  def new
    @student = Student.new
    @identification_types = TypeIdentification.all.map{|x| [x.name , x.id]}
    @titles = Title.where(enable: true).map{|x| [x.name , x.id]}
    @universities = University.where(enable: true).map{|x| [x.name , x.id]}
    @c_states_students = Process.where("enable=?", true).map{|ss| [ss.name, ss.id]}
    @workers =  Worker.where(enable:true).map{|w| [w.full_name, w.id]}
    @companies = Company.where(enable: true).order("name").map{|company| [company.name, company.id]}
    @cities = City.includes(:state).order(:name).map{|c| [c.name+" - "+c.state.name, c.id]}

  end

  # GET /students/1/edit
  def edit
    combo_box_company
    worker_all
    states_students
    combo_box_type_identification
  end

  # POST /students or /students.json
  def create
    @identification_types = TypeIdentification.all.map{|x| [x.name , x.id]}
    @titles = Title.where(enable: true).map{|x| [x.name , x.id]}
    @universities = University.where(enable: true).map{|x| [x.name , x.id]}
    @c_states_students = Process.where("enable=?", true).map{|ss| [ss.name, ss.id]}
    @workers =  Worker.where(enable:true).map{|w| [w.full_name, w.id]}
    @companies = Company.where(enable: true).order("name").map{|company| [company.name, company.id]}
    @cities = City.includes(:state).order(:name).map{|c| [c.name+" - "+c.state.name, c.id]}
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: t('students.student') + " " + t("commons.create_success")
    else
      @identification_types = TypeIdentification.all.map{|x| [x.name , x.id]}
      @titles = Title.where(enable: true).map{|x| [x.name , x.id]}
      @universities = University.where(enable: true).map{|x| [x.name , x.id]}
      @c_states_students = Process.where("enable=?", true).map{|ss| [ss.name, ss.id]}
      @workers =  Worker.where(enable:true).map{|w| [w.full_name, w.id]}
      @companies = Company.where(enable: true).order("name").map{|company| [company.name, company.id]}
      @cities = City.includes(:state).order(:name).map{|c| [c.name+" - "+c.state.name, c.id]}
       render :new, notice: t('students.student') + " " + t("commons.what_wrong")
    end
  end
=begin
        if @student.current_worker &&  @student.current_worker != nil
          profile_practice = Profile.where('(enable=? AND profile_type=?)',true,Profile.INTERN).pluck(:id)[0]
          w = Worker.create(first_name: @student.name, last_name: @student.last_name, phone: @student.phone,
                        phone_2: @student.phone_2 , email: @student.mail, profile_id: profile_practice,
                        identification:@student.identification,type_identification_id:@student.type_identification_id,enable:true)
          redirect_to @student, notice: t('students.student') + " " + t('commons.create_success')
    end

=end

  def update
    combo_box_type_identification
    combo_box_company
    worker_all
    states_students
      if @student.update(student_params)
        redirect_to @student, notice:  t('students.student') + "" + t("commons.update_success")
      else
        combo_box_type_identification
        combo_box_company
        worker_all
        states_students
               render :edit, status: :unprocessable_entity
      end

  end

  # DELETE /students/1 or /students/1.json
  def destroy
    delete_with_references(@student,students_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :last_name, :phone, :mail, :address, :score, :semester, :career, :comment, :leader_first, :leader_second, :mail_2, :phone_2, :age, :birthday, :link_university, :link_data, :identification, :issued_in, :city_id, :type_identification_id, :title_id, :university_id, :current_worker, :states_students_id,:body_1,:body_2)
    end
end
