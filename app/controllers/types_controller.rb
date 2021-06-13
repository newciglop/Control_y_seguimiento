class TypesController < ApplicationController
  before_action :set_type, only: %i[ show edit update destroy ]
  include TypesHelper
  include Icons
  include Deleteable

  def index
    show_icons

    @search = params[:search]
    if @search.present?
    @types = Type.all.where("lower(name) like lower(?)","%#{@search}%")
                 .paginate(page: params[:page], per_page: 30).order('id asc')
    else
      @types = Type.all.paginate(page: params[:page], per_page: 30).order('id asc')
    end
  end



  def new
    @type = Type.new
  end


  def edit
  end


  def create
    @type = Type.new(type_params)
      if @type.save
        redirect_to edit_type_path(@type), notice: "Tipo" + " " + t('commons.create_success')
      else
       render :new, notice: t('commons.what_wrong')
      end
  end


  def update
    enable_resources(@type,params)
      if @type.update(type_params)
        redirect_to edit_type_path(@type), notice: "Tipo" + " " + t('commons.update_success')
      else
        render :edit, t('commons.what_wrong')
     end
  end

  def destroy
    delete_with_references(@type, types_path)
  end

  private

    def set_type
      @type = Type.find(params[:id])
    end

    def type_params
      params.require(:type).permit(:name,:enable)
    end
end
