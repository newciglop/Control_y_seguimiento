class ModalitiesController < ApplicationController
  before_action :set_modality, only: %i[ show edit update destroy ]


  def index
    @modalities = Modality.all
  end


  def show
  end


  def new
    @modality = Modality.new
  end


  def edit
  end


  def create
    @modality = Modality.new(modality_params)
      if @modality.save
         redirect_to @modality, notice: "Modality was successfully created."
      else
         render :new, status: :unprocessable_entity
      end
  end


  def update
      if @modality.update(modality_params)
        redirect_to @modality, notice: "Modality was successfully updated."
      else
         render :edit, status: :unprocessable_entity
      end
  end


  def destroy
    if @modality.destroy
      redirect_to modalities_url, notice: "Modality was successfully destroyed."
    end
  end

  private

    def set_modality
      @modality = Modality.find(params[:id])
    end

    def modality_params
      params.require(:modality).permit(:name,:description)
    end
end
