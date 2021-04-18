class StudentsController < ApplicationController

  before_action :set_student, only: %i[ show edit update destroy ]
  include ComboBoxHelper
  include StudentsHelper

  # GET /students or /students.json
  def index

    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
    show_leader
  end

  # GET /students/new
  def new
    @identification_types = TypeIdentification.all.map{|x| [x.name , x.id]}
    combo_box_company
    worker_all
    combo_box_type_identification()
    states_students
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    combo_box_company
    worker_all
    states_students
    combo_box_type_identification()
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)
      if @student.save
        if @student.current_worker
          profile_practice = Profile.where('(enable=? AND profile_type=?)',true,Profile.INTERN).pluck(:id)[0]
          w = Worker.create(first_name: @student.name, last_name: @student.last_name, phone: @student.phone,
                        phone_2: @student.phone_2 , email: @student.mail, profile_id: profile_practice,
                        identification:@student.identification,type_identification_id:@student.type_identification_id,enable:true)
                   redirect_to @student, notice: "Student was successfully created."
          end
      else
        combo_box_company
        worker_all
        states_students
        combo_box_type_identification
       render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update

      if @student.update(student_params)
        redirect_to @student, notice: "Student was successfully updated."
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
    @student.destroy
    redirect_to students_url, notice: "Student was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :last_name, :phone,
                                      :mail, :address, :score, :semester,
                                      :career, :comment, :leader_first,:title_id,
                                      :leader_second, :mail_2, :phone_2,
                                      :age, :birthday, :link_university, :current_worker,
                                      :link_data, :identification,:body_2,:body_1 ,
                                      :issued_in ,:type_identification_id,:states_student_id,:city_id,:university_id)
    end
end
