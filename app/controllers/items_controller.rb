class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]


  def index
    @items = Item.all
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
         redirect_to edit_item_path(@item), notice: "Item was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end


  def update
    @enable = params[:enable]
    @enable ? @item.enable = @enable: @item.enable = false
      if @item.update(item_params)
         redirect_to edit_item_path(@item), notice: "Item was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end

  end

  def destroy
    if @item.destroy
      redirect_to items_url, notice: "Item was successfully destroyed."
    end
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end


    def item_params
      params.require(:item).permit(:name,:enable)
    end
end
