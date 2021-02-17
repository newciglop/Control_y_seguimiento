class TypesController < ApplicationController
  before_action :set_type, only: %i[ show edit update destroy ]
  include TypesHelper


  def index
    @types = Type.all
  end



  def new
    @type = Type.new
  end


  def edit
  end


  def create
    @type = Type.new(type_params)
      if @type.save
        redirect_to edit_type_path(@type), notice: "Type was successfully created."
      else
       render :new, status: :unprocessable_entity
      end
  end


  def update
    enable_resources(@type,params)
      if @type.update(type_params)
        redirect_to edit_type_path(@type), notice: "Type was successfully updated."
      else
        render :edit, status: :unprocessable_entity
     end
  end

  def destroy
    if @type.destroy
      redirect_to types_url, notice: "Type was successfully destroyed."
    end
  end

  private

    def set_type
      @type = Type.find(params[:id])
    end

    def type_params
      params.require(:type).permit(:name,:enable)
    end
end
