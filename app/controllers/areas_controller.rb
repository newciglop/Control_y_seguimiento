class AreasController < ApplicationController
  before_action :set_area, only: %i[ show edit update destroy ]


  def index
    @areas = Area.all
  end


  def show
  end


  def new
    @area = Area.new
  end


  def edit
  end


  def create
    @area = Area.new(area_params)
      if @area.save
        redirect_to edit_area_path(@area), notice: "Area was successfully created."
      else
        render :new
      end

  end


  def update
    @enable = params[:enable]
    @enable ? @area.enable = @enable : @area.enable = false
      if @area.update(area_params)
        redirect_to edit_area_path, notice: "Area was successfully updated."
      else
        render :edit
      end

  end


  def destroy
    if @area.destroy then
     redirect_to areas_path , notice: "Area was successfully destroyed."
     end
  end

  private

    def set_area
      @area = Area.find(params[:id])
    end


    def area_params
      params.require(:area).permit(:name,:enable)
    end
end
