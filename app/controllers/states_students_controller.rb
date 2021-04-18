class StatesStudentsController < ApplicationController
  before_action :set_states_student, only: %i[ show edit update destroy ]
  include StatesStudentsHelper
  include Deleteable


  # GET /states_students or /states_students.json
  def index
    @states_students = StatesStudent.all
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
         redirect_to @states_student, notice: "States student was successfully created."
         else
            render :new, status: :unprocessable_entity
         end
  end

  # PATCH/PUT /states_students/1 or /states_students/1.json
  def update
    enable_resources(@states_student,params)
      if @states_student.update(states_student_params)
       redirect_to @states_student, notice: "States student was successfully updated."
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
