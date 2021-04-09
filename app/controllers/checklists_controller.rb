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
    offer = Offer.find(params[:offer_id])
    checklist = offer.checklists.create

    redirect_to offer_checklist_path(offer)

  end

  # PATCH/PUT /checklists/1 or /checklists/1.json
  def update
    offer = Offer.find(params[:offer_id])
    checklist = offer.checklists.find(params[:id])
    checklist.update(checklist_params)
    respond_to do |format|
    format.json { head :no_content }
    end
  end

  # DELETE /checklists/1 or /checklists/1.json
  def destroy
    @checklist.destroy
    respond_to do |format|
      format.html { redirect_to checklists_url, notice: "Checklist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist
      @checklist = Checklist.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def checklist_params
      params.require(:checklist).permit( :title)
    end
end
