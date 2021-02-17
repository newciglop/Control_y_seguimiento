class ThemesController < ApplicationController
  before_action :set_theme, only: %i[ show edit update destroy ]
  include ThemesHelper


  def index
    @themes = Theme.all
  end


  def show
  end


  def new
    @theme = Theme.new
  end


  def edit
  end


  def create
    @theme = Theme.new(theme_params)
    if @theme.save
        redirect_to @theme, notice: "Theme was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end


  def update
    enable_resources(@theme,params)
      if @theme.update(theme_params)
         redirect_to @theme, notice: "Theme was successfully updated."
      else
        render :edit, status: :unprocessable_entity
     end
  end


  def destroy
    if @theme.destroy
       redirect_to themes_url, notice: "Theme was successfully destroyed."
    end
  end

  private

    def set_theme
      @theme = Theme.find(params[:id])
    end


    def theme_params
      params.require(:theme).permit(:name,:enable,:annexed)
    end
end
