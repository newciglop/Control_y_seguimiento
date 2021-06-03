class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]

  # GET /lists or /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  def create_items
    description = params[:description]
    admin_control_id = params[:admin_control_id]
    create =  List.create(admin_control_id: admin_control_id,description: description)
    redirect_to admin_control_path(params[:admin_control_id])
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)


      if @list.save
         redirect_to admin_control_path(@list.admin_control_id), notice: "List was successfully created."
      else
        redirect_to admin_control_path(@list.admin_control_id)
      end

  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update

      if @list.update(list_params)
        redirect_to admin_control_path(@list.admin_control_id, anchor: 'headingThree')
      else
        render :edit, status: :unprocessable_entity
      end

  end

  def destroy
    @list.destroy
      redirect_to admin_control_path(params[:admin_control_id]), notice: "List was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:description, :completed, :admin_control_id)
    end
end
