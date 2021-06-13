class ThemesController < ApplicationController
  before_action :set_theme, only: %i[ show edit update destroy ]
  include ThemesHelper
  include Deleteable
  include Icons

  def index
    show_icons
    @search = params[:search]
    if @search.present?
    @themes = Theme.all.where("lower(name) like lower(?)","%#{@search}%")
                  .paginate(page: params[:page], per_page: 30).order('id asc')
    else
    @themes = Theme.all.paginate(page: params[:page], per_page: 30).order('id asc')
    end


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
        redirect_to @theme, notice: t('admin_control.theme') + " " + t('commons.create_success')
      else
        render :new,notice: t('commons.what_wrong')
      end
  end


  def update
    enable_resources(@theme,params)
      if @theme.update(theme_params)
         redirect_to @theme,  notice: t('admin_control.theme') + " " + t('commons.update_success')
      else
        render :edit, notice: t('commons.what_wrong')
     end
  end


  def destroy
    delete_with_references(@theme,themes_path)
  end

  private

    def set_theme
      @theme = Theme.find(params[:id])
    end


    def theme_params
      params.require(:theme).permit(:name,:enable,:annexed)
    end
end
