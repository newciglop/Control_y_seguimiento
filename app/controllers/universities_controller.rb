class UniversitiesController < ApplicationController
  before_action :set_university, only: %i[ show edit update destroy ]
  include Deleteable
  include Resources
  include ComboBoxHelper
  # GET /universities or /universities.json
  def index
    @universities = University.all
  end


  def show
  end

  # GET /universities/new
  def new
    agreement
    combo_box_company
    @university = University.new
  end

  # GET /universities/1/edit
  def edit
    agreement
    combo_box_company
  end

  # POST /universities or /universities.json
  def create
    @university = University.new(university_params)
      if @university.save
        redirect_to @university, :flash => { :success => t('universities.university') + " " +t('action.create_success') }
      else
        agreement
        combo_box_company
        render :new, :flash => { :success => t('commons.what_wrong') }
      end
  end

  def update
    enable_resources(@university,params)
      if @university.update(university_params)
       redirect_to @university, :flash => { :success => t('universities.university') + " " +t('action.update_success') }
      else
        agreement
        combo_box_company
       render :edit, :flash => { :success => t('commons.what_wrong') }
    end
  end


  def destroy
    delete_with_references(@university,universities_path)
  end

  private

  def agreement
    @agreement = University.AGREEMENT
  end

    def set_university
      @university = University.find(params[:id])
    end


    def university_params
      params.require(:university).permit(:name, :enable, :address, :phone, :contact, :contact_phone, :agreement,:city_id)
    end
end