class StatesStudentsController < ApplicationController
  before_action :set_states_student, only: %i[ show edit update destroy ]
  include StatesStudentsHelper
  include Deleteable
  include Icons



  def index
    show_icons
    @search = params[:search] || ""

    if @search.present?
    @states_students = StatesStudent.all.where("lower(name) like lower(?)","%#{@search}%").paginate(page: params[:page], per_page: 30).order('id desc')
    else
    @states_students = StatesStudent.all.paginate(page: params[:page], per_page: 30).order('id desc')
    end

  end

  # GET /states_students/1 or /states_students/1.json
  def show
  end

  # GET /states_students/new
  def new
    @states_student = StatesStudent.new
  end

  # GET /states_students/1/edit
  def edit
  end

  # POST /states_students or /states_students.json
  def create
    @states_student = StatesStudent.new(states_student_params)

         if @states_student.save
         redirect_to edit_states_student_path(@states_student), notice: t('states_students.states_students') + " " + t('commons.create_success')
         else
            render :new, status: :unprocessable_entity
         end
  end

  # PATCH/PUT /states_students/1 or /states_students/1.json
  def update
    enable_resources(@states_student,params)
      if @states_student.update(states_student_params)
       redirect_to states_students_path, notice: t('states_students.states_students') + " " + t('commons.update_success')
      else
     render :edit, status: :unprocessable_entity
     end
  end

  # DELETE /states_students/1 or /states_students/1.json
  def destroy
    delete_with_references(@states_student,states_students_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_states_student
      @states_student = StatesStudent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def states_student_params
      params.require(:states_student).permit(:name, :enable , :color)
    end
end
