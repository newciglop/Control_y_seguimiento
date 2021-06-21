class ProcessesController < ApplicationController
  before_action :set_states_student, only: %i[ show edit update destroy ]
  include ProcessesHelper
  include Deleteable
  include Icons



  def index
    show_icons
    @search = params[:search] || ""

    if @search.present?
    @states_students = Process.all.where("lower(name) like lower(?)", "%#{@search}%").paginate(page: params[:page], per_page: 30).order('id desc')
    else
    @states_students = Process.all.paginate(page: params[:page], per_page: 30).order('id desc')
    end

  end

  # GET /states_students/1 or /states_students/1.json
  def show
  end

  # GET /states_students/new
  def new
    @process = Process.new
  end

  # GET /states_students/1/edit
  def edit
  end

  # POST /states_students or /states_students.json
  def create
    @process = Process.new(states_student_params)

         if @process.save
         redirect_to edit_process_path(@process), notice: t('states_students.states_students') + " " + t('commons.create_success')
         else
            render :new, status: :unprocessable_entity
         end
  end

  # PATCH/PUT /states_students/1 or /states_students/1.json
  def update
    enable_resources(@process,params)
      if @process.update(states_student_params)
       redirect_to processes_path, notice: t('states_students.states_students') + " " + t('commons.update_success')
      else
     render :edit, status: :unprocessable_entity
     end
  end

  # DELETE /states_students/1 or /states_students/1.json
  def destroy
    delete_with_references(@process, processes_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_states_student
      @process = Process.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def states_student_params
      params.require(:process).permit(:name, :enable , :color)
    end
end
