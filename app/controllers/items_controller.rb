class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  include Deleteable
  include Icons

  def index
    show_icons
    @search = params[:search]
    if @search.present?
    @items = Item.all.where("lower(name) like lower(?)","%#{@search}%")
                           .paginate(page: params[:page], per_page: 30).order('id asc')
    else
      @items = Item.all.paginate(page: params[:page], per_page: 30).order('id asc')
    end
  end


  def show
  end


  def new
    @item = Item.new
  end


  def edit
  end


  def create
    @item = Item.new(item_params)
      if @item.save
         redirect_to edit_item_path(@item), notice: t('admin_control.item') +  " " + t('commons.create_success')
      else
        render :new, notice: t('commons.what_wrong')
      end
  end


  def update
    @enable = params[:enable]
    @enable ? @item.enable = @enable: @item.enable = false
      if @item.update(item_params)
         redirect_to edit_item_path(@item), notice: t('admin_control.item') +  " " + t('commons.update_success')
      else
        render :edit, notice: t('commons.what_wrong')
      end

  end

  def destroy
    delete_with_references(@item,items_path)
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end


    def item_params
      params.require(:item).permit(:name,:enable)
    end
end
