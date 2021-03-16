class OffersController < ApplicationController
  include ComboBoxHelper
  before_action :set_offer, only: %i[ show edit update destroy ]


  def index
    @offers = Offer.all
  end


  def show
  end


  def new
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
  end


  def create
    @offer = Offer.new(offer_params)


      if @offer.save
         redirect_to @offer, notice: "Offer was successfully created."
      else
         render :new, status: :unprocessable_entity
      end
  end


  def update

      if @offer.update(offer_params)
       redirect_to @offer, notice: "Offer was successfully updated."
      else
      render :edit, status: :unprocessable_entity
      end

  end


  def destroy
    if @offer.destroy
     redirect_to offers_url, notice: "Offer was successfully destroyed."
    end
  end

  private

  def generate_code
    offer = Offer.all.map{|x| x.code}
    @suggest_code = offer.max == nil ? 1 : offer.max + 1
  end

    def set_offer
      @offer = Offer.find(params[:id])
    end


  def  offer_params
    params.require(:offer).permit(:code, :worker_id ,:modality_id ,:status,
                                  :publication_date, :date_submission_obs,
                                  :remaining_hour_obs, :remaining_days_obs, :status_obs,
                                  :city_id, :company_id, :presented_value, :budget_value, :official_page,
                                  :email_company, :email_alternative, :link_document)

  end
end
