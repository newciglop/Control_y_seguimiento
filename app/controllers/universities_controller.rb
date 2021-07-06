class UniversitiesController < ApplicationController
  before_action :set_university, only: %i[ show edit update destroy ]
  include Deleteable
  include Resources
  include ComboBoxHelper
  include Icons

  def index
    show_icons
    @search = params[:search] || ""



    if !@search.present?
      @universities = University.all.paginate(page: params[:page], per_page: 30)
      else
    @universities = University.all.where("lower(name) like lower(?)","%#{@search}%").paginate(page: params[:page], per_page: 30)
    end




  end


  def show
  end


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
        redirect_to @university, :flash => { :success => t('universities.university') + " " +t('commons.create_success') }
      else
        agreement
        combo_box_company
        render :new, :flash => { :success => t('commons.what_wrong') }
      end
  end

  def update
    enable_resources(@university,params)
      if @university.update(university_params)
       redirect_to @university, :flash => { :success => t('universities.university') + " " +t('commons.update_success') }
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
