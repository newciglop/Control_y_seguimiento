class AdminControlsController < ApplicationController

  before_action :set_admin_control , only: [:edit,:destroy,:create,:update]
  include AdminControlsHelper
  include ComboBoxHelper

  def index
    @admin_controls = AdminControl.all
  end


  def show
    @admin_control = AdminControl.find(params[:id])
    @checklist =  @admin_control.checklists.build
    combo_box_data
    show_tracking_type(@admin_control)
    show_state_admin_control(@admin_control)
    if @admin_control.support != nil  && @admin_control.support != ""
    show_responsible_and_support(@admin_control)
    end




  end


  def new
    @admin_control = AdminControl.new
    combo_box_data
  end


  def edit
    combo_box_data
  end


  def create
    combo_box_data()
    @admin_control = AdminControl.new(admin_control_params)
    @admin_control.user_id = current_user.id
      if @admin_control.save
         redirect_to @admin_control, notice: "Admin control was successfully created."
      else
        combo_box_data()
         render :new, status: :unprocessable_entity

      end
  end


  def update
       combo_box_data()
      if @admin_control.update(admin_control_params)
        redirect_to @admin_control, notice: "Admin control was successfully updated."
      else

        combo_box_data()
      render :edit, status: :unprocessable_entity
      end

  end


  def destroy
    if @admin_control.destroy
       redirect_to admin_controls_url, notice: "Admin control was successfully destroyed."
    end
  end

  private

  def combo_box_data
    generate_code()
    combo_box_general_data()
    combo_box_company()
    combo_box_responsible()
    combo_box_personal()
    combo_box_support()
  end

  def generate_code
     admin_control = AdminControl.all.map{|x| x.code}
     @suggest_code = admin_control.max == nil ? 1 : admin_control.max + 1
  end


    def set_admin_control
      @admin_control = AdminControl.find(params[:id])
    end


    def admin_control_params
      params.require(:admin_control).permit(:code,:concept_id,:theme_id,
                                            :type_id,:item_id,:start_date,:final_date,
                                            :tracking_type,:state,:company_id,:city_id,
                                            :responsible_function_id,:responsible,:support,
                                            :description_advance,:advance,:process,:link_process,:link_drive,:user_id)
    end
end
