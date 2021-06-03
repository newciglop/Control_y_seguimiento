class ChecklistItemsController < ApplicationController
  before_action :set_checklist_item, only: %i[ update destroy ]

  def index
    @checklist_items = ChecklistItem.all
  end

  def show

       admin_control = AdminControl.find(params[:admin_control_id])
    checklist = admin_control.checklists.find(params[:checklist_id])
    checklist_item = checklist.checklist_items.find(params[:id])

       if params[:status_id].present?
         @status = ChecklistItem.where(id:checklist_item.id).update(status:params[:status_id])
       else
         @status = ChecklistItem.where(id:checklist_item.id).update(status:'without-start')
       end

       if request.xhr?
         respond_to do |format|
           format.json {
             render json: {skus: @status}
           }
         end
       end

  end

  def create
    admin_control = AdminControl.find(params[:admin_control_id])
    checklist = admin_control.checklists.find(params[:checklist_id])
    checklist_item = checklist.checklist_items.new(checklist_item_params)
    checklist_item.status = 'without_start'
    checklist_item.save
    redirect_to  "/admin_controls/#{admin_control.id}"
  end

  # PATCH/PUT /checklist_items/1 or /checklist_items/1.json
  def update
    respond_to do |format|
      if @checklist_item.update(checklist_item_params)
        format.html { redirect_to @checklist_item, notice: "Checklist item was successfully updated." }
        format.json { render :show, status: :ok, location: @checklist_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @checklist_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklist_items/1 or /checklist_items/1.json
  def destroy
    admin_control = AdminControl.find(params[:admin_control_id])
    checklist = admin_control.checklists.find(params[:checklist_id])
    checklist_item = checklist.checklist_items.find(params[:id])
    checklist_item.destroy
    redirect_to  "/admin_controls/#{admin_control.id}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist_item
      @checklist_item = ChecklistItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checklist_item_params
      params.require(:checklist_item).permit(:checklist_id, :title, :status)
    end
end
