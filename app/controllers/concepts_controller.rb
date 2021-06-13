class ConceptsController < ApplicationController
  before_action :set_concept, only: %i[ show edit update destroy ]
  include ConceptsHelper
  include Deleteable
  include Icons

  def index
    show_icons
    @search = params[:search]

    if @search.present?
      @concepts = Concept.all.where("lower(name) like lower(?)","%#{@search}%")
                      .paginate(page: params[:page], per_page: 30).order('id desc')
    else
      @concepts = Concept.all.paginate(page: params[:page], per_page: 30).order('id desc')
    end

  end


  def show
  end


  def new
    @concept = Concept.new
  end


  def edit
  end


  def create
    @concept = Concept.new(concept_params)
      if @concept.save
        redirect_to edit_concept_path(@concept), notice: t('admin_control.concept') + " " + t('commons.create_success')
      else
        render :new, status: :unprocessable_entity , notice: t('commons.what_wrong')
      end

  end


  def update
      enable_resources(@concept,params)
      if @concept.update(concept_params)
       redirect_to edit_concept_path(@concept), notice: t('admin_control.concept') + " " + t('commons.update_success')
      else
         render :edit, status: :unprocessable_entity ,notice: t('commons.what_wrong')
      end

  end


  def destroy
    delete_with_references(@concept,concepts_path)
  end

  private

    def set_concept
      @concept = Concept.find(params[:id])
    end


    def concept_params
      params.require(:concept).permit(:name,:enable)
    end
end
