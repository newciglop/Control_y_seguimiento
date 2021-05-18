class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]


  def index
    @search = params[:fullname] || ""
    @companies = Company.where("(LOWER(name) like LOWER(?) OR LOWER(identification) like LOWER(?)) " ,"%#{@search}%","%#{@search}%")
                     .order('name')
  end


  def show
  end


  def new
    @company = Company.new
  end


  def edit
  end


  def create
    @company = Company.new(company_params)
    if @company.save
       redirect_to @company, notice: "Company was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end


  def update
    @enable = params[:enable]
    @enable ? @company.enable = @enable: @company.enable = false
      if @company.update(company_params)
         redirect_to @company, notice: "Company was successfully updated."
      else
       render :edit, status: :unprocessable_entity
      end
  end


  def destroy
    delete_with_references(@companies,companies_path)
  end

  private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name,:identification,:enable,:address,:phone,:email)
    end
end
