class TitlesController < ApplicationController

  before_action :set_title, only: %i[ show edit update destroy ]
  include Resources
  include Deleteable

  # GET /titles or /titles.json
  def index
    @titles = Title.all
  end

  # GET /titles/1 or /titles/1.json
  def show
  end

  # GET /titles/new
  def new
    @title = Title.new
  end

  # GET /titles/1/edit
  def edit
  end

  # POST /titles or /titles.json
  def create
    @title = Title.new(title_params)

     if @title.save
        redirect_to edit_title_path(@title), :flash => { :success => t('titles.titles') + " "+  t('action.create_success')}
     else
       render :new, status: :unprocessable_entity
      end

  end


  def update
    enable_resources(@title,params)
      if @title.update(title_params)
         redirect_to titles_path, :flash => { :success => t('titles.titles') + " "+  t('action.update_success')}
        else
       render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    delete_with_references(@title,titles_path)
  end

  private

    def set_title
      @title = Title.find(params[:id])
    end


    def title_params
      params.require(:title).permit(:name, :enable)
    end
end
