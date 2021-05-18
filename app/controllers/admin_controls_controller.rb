class AdminControlsController < ApplicationController

  before_action :set_admin_control , only: [:show,:edit,:destroy,:update]
  include AdminControlsHelper
  include ComboBoxHelper
  include RegisterBooksHelper

  def index
    @responsible_functions = ResponsibleFunction.where(enable:true).map{|x| [x.name, x.id]}
    @search = if params[:search]
                Date.parse(params[:search])
              else
                Date.today
              end



    filters = {}
    @responsible = params[:responsible]
    if @responsible  && @responsible != "" then
      filters["responsible_function_id"] = @responsible
    end
    @admin_controls = AdminControl.all.by_month(@search).where(filters).paginate(page: params[:page], per_page: 30).order('created_at desc')
    @months = (Date.today - 1.year..Date.today).map(&:beginning_of_month).uniq.reverse.map{|dt| [dt.strftime("%Y-%m"), dt] }
  end


  def show
    show_states
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
        @admin_control.sa =  "sa-#{@admin_control.id}"
        @admin_control.save
        create_register_admin(@admin_control,current_user)
        # up_register =  RegisterBook.where(admin_control_id: @admin_control.id).update(code_sa: @admin_control.sa)
         redirect_to @admin_control, notice: "Admin control was successfully created."
      else
        combo_box_data()
         render :new, status: :unprocessable_entity

      end
  end


  def update
       combo_box_data()
      if @admin_control.update(admin_control_params)
        puts "#{current_user.id} #{current_user.email}"
        update_register_admin_control(@admin_control,current_user)
        redirect_to @admin_control, notice: "Admin control was successfully updated."
      else

        combo_box_data()
      render :edit, status: :unprocessable_entity
      end

  end


  def destroy
    checklist = Checklist.where(admin_control_id: @admin_control.id)
    checklist_items = ChecklistItem.where(checklist_id: checklist.pluck(:id) ).delete_all
    checklist_destroy = Checklist.where(admin_control_id: @admin_control.id).delete_all
    if destroy_register_admin_control(@admin_control,current_user)
        if delete_ref_admin_control(@admin_control)
           if @admin_control.destroy
              redirect_to admin_controls_url, notice: "Admin control was successfully destroyed."
           end
        end
    end

  end



  def create_register_admin(obj,current_user)
    register = RegisterBook.new(admin_control_id:obj.id,
                                create_user:"#{current_user.first_name}" + " " + "#{current_user.last_name}",
                                create_time:Date.today,offer_id: nil,
                                concept_admin: obj.concept.name,theme_admin:obj.theme.name,
                                type_admin:obj.type.name,item_admin: obj.type.name,company: obj.company.name,
                                code_sa: obj.sa,code: obj.code,rol_responsible: obj.responsible_function.name,is_admin_control:true )
    register.save
  end


  #Time.now.strftime("%I:%M:%S %P")
  def update_register_admin_control(obj,current_user)
    RegisterBook.where(admin_control_id:obj.id).update(update_user:"#{current_user.first_name}" + " " + "#{current_user.last_name}",
                                                       update_time:Date.today,
                                                       concept_admin: obj.concept.name,
                                                       theme_admin:obj.theme.name,
                                                       type_admin:obj.type.name,
                                                       item_admin: obj.item.name,
                                                       rol_responsible: obj.responsible_function.name,
                                                       code_sa: obj.sa,code: obj.code,
                                                       company:obj.company.name)
  end




  def destroy_register_admin_control(obj,current_user)
    @result = ""
    dia_actual = Date.today
    register = RegisterBook.where(admin_control_id:obj.id)
                   .update(destroy_user:"#{current_user.first_name}" + " " + "#{current_user.last_name}",
                           destroy_time: dia_actual,time_destroy:Time.now.strftime("%I:%M:%S %P"))
    if register
      @result = true
    else
      @result = false
    end
    return @result
  end

  def delete_ref_admin_control(obj)
    r = RegisterBook.where(admin_control_id: obj.id).update(admin_control_id: nil)
    if r
      result_admin = true
    else
      result_admin = false
    end
    return result_admin
  end


  private

  def show_states
    @status_checklist = ChecklistItem.STATUS_OPTIONS.map{|x| [x[0],x[1]]}
  end

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
