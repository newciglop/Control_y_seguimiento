class StatesStudentsController < ApplicationController
  before_action :set_states_student, only: %i[ show edit update destroy ]

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

    respond_to do |format|
      if @states_student.save
        format.html { redirect_to @states_student, notice: "States student was successfully created." }
        format.json { render :show, status: :created, location: @states_student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @states_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /states_students/1 or /states_students/1.json
  def update
    respond_to do |format|
      if @states_student.update(states_student_params)
        format.html { redirect_to @states_student, notice: "States student was successfully updated." }
        format.json { render :show, status: :ok, location: @states_student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @states_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /states_students/1 or /states_students/1.json
  def destroy
    @states_student.destroy
    respond_to do |format|
      format.html { redirect_to states_students_url, notice: "States student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_states_student
      @states_student = StatesStudent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def states_student_params
      params.require(:states_student).permit(:name, :enable)
    end
end
