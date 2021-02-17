class ResponsibleFunctionsController < ApplicationController
  before_action :set_responsible_function, only: %i[ show edit update destroy ]
  include ResponsibleFunctionsHelper

  def index
    @responsible_functions = ResponsibleFunction.all
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
         redirect_to @responsible_function, notice: "Responsible function was successfully created."
      else
         render :new, status: :unprocessable_entity
    end
  end


  def update
    enable_resources(@responsible_function,params)
      if @responsible_function.update(responsible_function_params)
        redirect_to @responsible_function, notice: "Responsible function was successfully updated."
      else
        render :edit, status: :unprocessable_entity
       end
  end


  def destroy
    if  @responsible_function.destroy
       redirect_to responsible_functions_url notice: "Responsible function was successfully destroyed."
    end
  end

  private
    def set_responsible_function
      @responsible_function = ResponsibleFunction.find(params[:id])
    end

    def responsible_function_params
      params.require(:responsible_function).permit(:name,:description,:enable)
    end
end
