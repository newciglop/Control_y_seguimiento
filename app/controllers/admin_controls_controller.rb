class AdminControlsController < ApplicationController
  include ComboBoxHelper
  before_action :set_admin_control, only: %i[ show edit update destroy ]


  def index
    @admin_controls = AdminControl.all
  end


  def show
  end


  def new
    generate_code()
    combo_box_general_data()
    @admin_control = AdminControl.new
  end


  def edit
    combo_box_general_data()
  end


  def create
    @admin_control = AdminControl.new(admin_control_params)
      if @admin_control.save
         redirect_to @admin_control, notice: "Admin control was successfully created."
      else
         render :new, status: :unprocessable_entity
         generate_code()
         combo_box_general_data()
      end
  end


  def update
    respond_to do |format|
      if @admin_control.update(admin_control_params)
        format.html { redirect_to @admin_control, notice: "Admin control was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_control }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_controls/1 or /admin_controls/1.json
  def destroy
    @admin_control.destroy
    respond_to do |format|
      format.html { redirect_to admin_controls_url, notice: "Admin control was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def generate_code
     admin_control = AdminControl.map{|x| x.code}
     @suggest_code = admin_control.max == nil ? 1 : admin_control.max + 1
  end


    def set_admin_control
      @admin_control = AdminControl.find(params[:id])
    end


    def admin_control_params
      params.require(:admin_control).permit(:code,:concept_id,:theme_id,
                                            :type_id,:item_id,:start_date,:final_date,
                                            :tracking_type,:state,:company_id,:city_id)
    end
end
