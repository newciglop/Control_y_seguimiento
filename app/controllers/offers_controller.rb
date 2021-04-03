class OffersController < ApplicationController
  before_action :set_offer, only: %i[ show edit update destroy ]
  include ComboBoxHelper
  include OffersHelper

  def index
    @offers = Offer.all

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
    if @offer.destroy
     redirect_to offers_url, notice: "Offer was successfully destroyed."
    end
  end

  def generate_code
    offer = Offer.all.map{|x| x.code}
  @suggest_code = offer.max == nil ? 1 : offer.max + 1
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
