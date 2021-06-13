class ModalitiesController < ApplicationController
  include ModalitiesHelper
  before_action :set_modality, only: %i[ show edit update destroy ]
  include Deleteable
  include Icons

  def index
    show_icons

    @search = params[:search]

    if @search.present?
       @modalities = Modality.all.where("lower(name) like lower(?)","%#{@search}%")
                         .paginate(page: params[:page], per_page: 30).order('id asc')
    else
      @modalities = Modality.all.paginate(page: params[:page], per_page: 30).order('id asc')
    end

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
         redirect_to @modality, notice: "Modalidad" +  " " + t('commons.create_success')
      else
         render :new, notice: t('commons.what_wrong')
      end
  end


  def update

    enable_resources(@modality,params)
      if @modality.update(modality_params)
        redirect_to @modality, notice: "Modalidad" +  " " + t('commons.update_success')
      else
         render :edit,notice: t('commons.what_wrong')
      end
  end


  def destroy
    delete_with_references(@modality,modalities_path)
  end

  private

    def set_modality
      @modality = Modality.find(params[:id])
    end

    def modality_params
      params.require(:modality).permit(:name,:description)
    end
end
