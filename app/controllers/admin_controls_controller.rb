class AdminControlsController < ApplicationController

  before_action :set_admin_control ,  only: [:show,:edit,:destroy,:update]
  include AdminControlsHelper
  include ComboBoxHelper
  include RegisterBooksHelper

  def index
    @responsible_functions = ResponsibleFunction.where(enable:true).map{|x| [x.name, x.id]}
    @months = (Date.today - 1.year..Date.today).map(&:beginning_of_month).uniq.reverse.map{|dt| [dt.strftime("%Y-%m"), dt] }
    @companies = Company.where(enable: true).order("name").map{|company| [company.name, company.id]}

    @search = if params[:search]
                Date.parse(params[:search])
              else
                Date.today
              end



    @company = params[:company] || " "
    @responsible = params[:responsible] || ""

    if @responsible != "" && @company != ""
      @admin_controls = AdminControl.all.joins(:company).where("lower(companies.name) like lower(?)","%#{@company}%")
                            .joins(:responsible_function).where("lower(responsible_functions.name) like lower(?)","%#{@responsible}%")
                            .by_month(@search)
                            .paginate(page: params[:page], per_page: 30).order('id desc')
    elsif @responsible != ""
      @admin_controls =  AdminControl.all.joins(:responsible_function).where("lower(responsible_functions.name) like lower(?)","%#{@responsible}%")
          .by_month(@search)
          .paginate(page: params[:page], per_page: 30).order('id desc')
    elsif @company != ""
      @admin_controls =  AdminControl.all.joins(:company).where("lower(companies.name) like lower(?)","%#{@company}%")
                .by_month(@search)
          .paginate(page: params[:page], per_page: 30).order('id desc')
    else
      @admin_controls = AdminControl.all.by_month(@search)
          .paginate(page: params[:page], per_page: 30).order('id desc')
    end


  end


  def show
    show_states
    #combo_box_data
    percent_completed(@admin_control)
    show_tracking_type(@admin_control)
    show_state_admin_control(@admin_control)
    AdminControl.where(id:@admin_control.id).update(advance: percent_completed(@admin_control))
    ids =  HasSupport.where(admin_control_id: @admin_control.id).map{|x| x.worker_id}
    @support_has_name =  Worker.where(id:ids).map{|x| [x.full_name,x.id]}

    ids_manager =  HasManager.where(admin_control_id: @admin_control.id).map{|x| x.worker_id}
    @manager_has_name =  Worker.where(id:ids_manager).map{|x| [x.full_name,x.id]}
  end


  def new
    @admin_control = AdminControl.new
    combo_box_data
    worker_all
  end


  def edit
    worker_all
    combo_box_data
    percent_completed(@admin_control)
    ids =  HasSupport.where(admin_control_id: @admin_control.id).map{|x| x.worker_id}
    @support_has_name =  Worker.where(id:ids).map{|x| [x.full_name,x.id]}

    ids_manager =  HasManager.where(admin_control_id: @admin_control.id).map{|x| x.worker_id}
    @manager_has_name =  Worker.where(id:ids_manager).map{|x| [x.full_name,x.id]}
  end


  def create
    worker_all
    combo_box_data()

    @admin_control = AdminControl.new(admin_control_params)
    @admin_control.user_id = current_user.id
    @admin_control.support_elements = params[:support_elements]
    @admin_control.manager_elements = params[:manager_elements]
    @admin_control.advance = percent_completed(@admin_control)
      if @admin_control.save
        @admin_control.save_supports
        @admin_control.save_managers
        @admin_control.sa =  "sa-#{@admin_control.id}"
        @admin_control.save
        create_register_admin(@admin_control,current_user)
        # up_register =  RegisterBook.where(admin_control_id: @admin_control.id).update(code_sa: @admin_control.sa)
         redirect_to @admin_control, notice: "segto admin fue creado exitosamente"
      else
        combo_box_data()
         render :new, status: :unprocessable_entity

      end
  end


  def update
        worker_all
       combo_box_data()

      if @admin_control.update(admin_control_params)
        @admin_control.support_elements = params[:support_elements]
        @admin_control.manager_elements = params[:manager_elements]
        @admin_control.save_supports
        @admin_control.save_managers
        update_register_admin_control(@admin_control,current_user)
        redirect_to @admin_control, notice: "segto admin fue actualizado exitosamente."
      else

        combo_box_data()
      render :edit, status: :unprocessable_entity
      end

  end


  def destroy
    list = List.where(admin_control_id: @admin_control.id).delete_all
    HasManager.where(admin_control_id: @admin_control.id).delete_all
    HasSupport.where(admin_control_id: @admin_control.id).delete_all
    if destroy_register_admin_control(@admin_control,current_user)
        if delete_ref_admin_control(@admin_control)
           if @admin_control.destroy
              redirect_to admin_controls_url, notice: "segto admin fue eliminado exitosamente"
           end
        end
    end

  end

  def percent_completed(admin_control)
    @total_items ||= admin_control.lists.count
    return 0 if @total_items == 0
    @percent_completed = ((admin_control.lists.select(&:completed?).count.to_f / @total_items) * 100).round
  end





  def destroy_support
    worker_id = params[:worker_id]
    admin_control_id = params[:admin_control_id]
    HasSupport.where(admin_control_id: admin_control_id).where(worker_id: worker_id).destroy_all
    redirect_to edit_admin_control_path(admin_control_id)
  end

  def destroy_manager
    worker_id = params[:worker_id]
    admin_control_id = params[:admin_control_id]
    HasManager.where(admin_control_id: admin_control_id).where(worker_id: worker_id).destroy_all
    redirect_to edit_admin_control_path(admin_control_id)
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
    combo_box_personal()
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
                                            :description_advance,:advance,:process,:link_process,:link_drive,:user_id,
                                            support_elements:[],manager_elements:[])
    end
end
