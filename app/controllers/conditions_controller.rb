class ConditionsController < ApplicationController
  before_action :set_states_student, only: %i[ show edit update destroy ]
  include ConditionsHelper
  include Deleteable
  include Icons



  def index
    show_icons
    @search = params[:search] || ""

    if @search.present?
    @states_students = Condition.all.where("lower(name) like lower(?)", "%#{@search}%").paginate(page: params[:page], per_page: 30).order('id desc')
    else
    @states_students = Condition.all.paginate(page: params[:page], per_page: 30).order('id desc')
    end

  end

  # GET /Conditiones/1 or /Conditiones/1.json
  def show
  end

  # GET /Conditiones/new
  def new
    @condition = Condition.new
  end

  # GET /Conditiones/1/edit
  def edit
  end

  # POST /Conditiones or /Conditiones.json
  def create
    @condition = Condition.new(states_student_params)

         if @condition.save
         redirect_to edit_condition_path(@condition), notice: t('states_students.states_students') + " " + t('commons.create_success')
         else
            render :new, status: :unprocessable_entity
         end
  end

  # PATCH/PUT /Conditiones/1 or /Conditiones/1.json
  def update
    enable_resources(@condition, params)
      if @condition.update(states_student_params)
       redirect_to conditions_path, notice: t('states_students.states_students') + " " + t('commons.update_success')
      else
     render :edit, status: :unprocessable_entity
     end
  end

  # DELETE /Conditions/1 or /Condition/1.json
  def destroy
    delete_with_references(@condition, conditions_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_states_student
      @condition = Condition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def states_student_params
      params.require(:condition).permit(:name, :enable , :color)
    end
end
