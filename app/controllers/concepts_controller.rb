class ConceptsController < ApplicationController
  before_action :set_concept, only: %i[ show edit update destroy ]
  include ConceptsHelper

  def index
    @concepts = Concept.all
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
        redirect_to edit_concept_path(@concept), notice: "Concept was successfully created."
      else
        render :new, status: :unprocessable_entity
      end

  end


  def update
      enable_resources(@concept,params)
      if @concept.update(concept_params)
       redirect_to edit_concept_path(@concept), notice: "Concept was successfully updated."
      else
         render :edit, status: :unprocessable_entity
      end

  end


  def destroy
    if @concept.destroy
       redirect_to concepts_url, notice: "Concept was successfully destroyed."
    end
  end

  private

    def set_concept
      @concept = Concept.find(params[:id])
    end


    def concept_params
      params.require(:concept).permit(:name,:enable)
    end
end
