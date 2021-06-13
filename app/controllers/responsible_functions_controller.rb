class ResponsibleFunctionsController < ApplicationController
  before_action :set_responsible_function, only: %i[ show edit update destroy ]
  include ResponsibleFunctionsHelper
  include Deleteable
  include Icons

  def index
    show_icons
    @search = params[:search]

    if @search.present?
      @responsible_functions = ResponsibleFunction.all.where("lower(name) like lower(?)","%#{@search}%")
                                   .paginate(page: params[:page], per_page: 30).order('id asc')
    else
      @responsible_functions = ResponsibleFunction.all
                                   .paginate(page: params[:page], per_page: 30).order('id asc')
    end


  end


  def show
  end

  def new
    @responsible_function = ResponsibleFunction.new
  end


  def edit
  end


  def create
    @responsible_function = ResponsibleFunction.new(responsible_function_params)
      if @responsible_function.save
         redirect_to @responsible_function, notice: "Rol responsable" + " " + t('commons.create_success')
      else
         render :new, status: :unprocessable_entity , notice: "algo salio mal"
    end
  end


  def update
    enable_resources(@responsible_function,params)
      if @responsible_function.update(responsible_function_params)
        redirect_to @responsible_function, notice: "Rol responsable" + " " + t('commons.update_success')
      else
        render :edit, notice: "algo salio mal"
       end
  end


  def destroy
    delete_with_references(@responsible_function,responsible_functions_path)
  end

  private
    def set_responsible_function
      @responsible_function = ResponsibleFunction.find(params[:id])
    end

    def responsible_function_params
      params.require(:responsible_function).permit(:name,:description,:enable)
    end
end
