class ChecklistsController < ApplicationController
  before_action :set_checklist, only: %i[ show edit update destroy ]

  # GET /checklists or /checklists.json
  def index
    @checklists = Checklist.all
  end

  # GET /checklists/1 or /checklists/1.json
  def show
  end

  # GET /checklists/new
  def new
    @checklist = Checklist.new
  end

  # GET /checklists/1/edit
  def edit
  end

  # POST /checklists or /checklists.json
  def create

    admin_control = AdminControl.find(params[:admin_control_id])
    checklist = admin_control.checklists.create
    redirect_to  admin_control_path(admin_control.id)

  end

  # PATCH/PUT /checklists/1 or /checklists/1.json
  def update
    admin_control = AdminControl.find(params[:admin_control_id])
    checklist = admin_control.checklists.find(params[:id])
    checklist.update(checklist_params)
    redirect_to  admin_control_path(admin_control.id)
  end

  # DELETE /checklists/1 or /checklists/1.json
  def destroy
    @checklist.destroy
  end

  private


    # Use callbacks to share common setup or constraints between actions.
    def set_checklist
      @checklist = Checklist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checklist_params
      params.require(:checklist).permit( :admin_control_id,:title)
    end
end
