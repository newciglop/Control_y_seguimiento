class OffersController < ApplicationController
  before_action :set_offer, only: %i[ show edit update destroy ]
  include ComboBoxHelper
  include OffersHelper
  include RegisterBooksHelper

  def index
    @offers = Offer.all.paginate(page: params[:page], per_page: 30).order('created_at desc')



  end


  def show

  end


  def new
    generate_code
    combo_box_leader
    combo_box_modalities
    combo_box_status_offers
    combo_box_status_yes_or_not
    combo_box_company
    @offer = Offer.new

  end


  def edit
    combo_box_leader
    combo_box_modalities
    combo_box_status_offers
    combo_box_status_yes_or_not
    combo_box_company
    generate_code
    submission_obs(@offer.id)
    observations_report(@offer.id)
    deadline_submission_offers(@offer.id)
    offer_evaluation_report(@offer.id)
    obs_offer_evaluation_report(@offer.id)
    date_acceptance_offers(@offer.id)

  end


  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
      if @offer.save
        @offer.sl =  "sl-#{@offer.id}"
        @offer.save
        create_register_offer(@offer,current_user)
         redirect_to offers_path, notice: "Offer was successfully created."
      else
        combo_box_company
        generate_code
        combo_box_leader
        combo_box_modalities
        combo_box_status_offers
        combo_box_status_yes_or_not

         render :new, status: :unprocessable_entity
      end
  end


  def update
    if @offer.update(offer_params)
       update_register_offer(@offer,current_user)
       redirect_to @offer, notice: "Offer was successfully updated."
    else
      combo_box_company
      combo_box_leader
      combo_box_modalities
      combo_box_status_offers
      combo_box_status_yes_or_not
      generate_code

      render :edit, status: :unprocessable_entity
      end

  end


  def destroy
    if destroy_register_offer(@offer,current_user)
      if delete_ref_offer(@offer)
         if @offer.destroy
          redirect_to offers_url, notice: "Offer was successfully destroyed."
         end
      end
    end
  end

  def generate_code
    offer = Offer.all.map{|x| x.code}
  @suggest_code = offer.max == nil ? 1 : offer.max + 1
  end

  def create_register_offer(obj,current_user)
    register =  RegisterBook.new(offer_id:obj.id,create_user:"#{current_user.first_name}" + " " + "#{current_user.last_name}",
                                 create_time:Date.today,admin_control_id:nil,leader_sl:obj.worker.full_name,
                                 modality_sl: obj.modality.name, status_sl: obj.status,
                                 company: obj.company.name , code_sl:obj.sl ,code: obj.code,is_offer:true)
    register.save!
  end


  def update_register_offer(obj,current_user)
    ru = RegisterBook.where(offer_id:obj.id).update(update_user:"#{current_user.first_name}" + " " + "#{current_user.last_name}",
                                                    leader_sl: obj.worker.full_name,
                                                    update_time:Date.today,
                                                    modality_sl:obj.modality.name,
                                                    status_sl:obj.status,code:obj.code,
                                                    company:obj.company.name)
  end


  def destroy_register_offer(obj,current_user)
    @result = ""
    dia_actual = Date.today

    register = RegisterBook.where(offer_id:obj.id)
                   .update(destroy_user:"#{current_user.first_name}" + " " + "#{current_user.last_name}",
                           destroy_time:dia_actual,time_destroy:Time.now.strftime("%I:%M:%S %P"))
    if register
      @result = true
    else
      @result = false
    end
    return @result
  end


  def delete_ref_offer(obj)
    r = RegisterBook.where(offer_id: obj.id).update(offer_id: nil)
    if r
      result_offer = true
    else
      result_offer = false
    end
    return result_offer
  end

  private





    def set_offer
      @offer = Offer.find(params[:id])
    end


  def  offer_params
    params.require(:offer).permit(:code, :worker_id ,:modality_id ,:status,:company_id,
                                  :publication_date, :date_submission_obs,
                                  :remaining_hour_obs, :remaining_days_obs, :status_obs,
                                  :city_id,:presented_value, :budget_value, :official_page,
                                  :email_company, :email_alternative, :link_document,
                                  :date_publication_observations_report, :remaining_day_obs_report,
                                  :remaining_hour_obs_report,:status_obs_report,
                                  :date_deadline_submission_offers,:remaining_day_submission_offers,
                                  :remaining_hour_submission_offers,:status_submission_offers,
                                  :date_offer_evaluation_report, :remaining_day_offer_evaluation_report,
                                  :remaining_hour_offer_evaluation_report, :status_offer_evaluation_report,
                                  :date_obs_offer_evaluation_report, :remaining_day_obs_offer_evaluation_report,
                                  :remaining_hour_obs_offer_evaluation_report,:status_obs_offer_evaluation_report,
                                  :date_acceptance_offers,  :remaining_day_acceptance_offers,
                                  :remaining_hour_acceptance_offers, :status_acceptance_offers ,:object )


  end
end
