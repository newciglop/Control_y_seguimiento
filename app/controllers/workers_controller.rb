class WorkersController < ApplicationController
  before_action :set_worker, only: %i[ show edit update destroy ]
  include ComboBoxHelper
  include WorkersHelper

  def index
    @workers = Worker.all
  end


  def show
    find_name_profile(@worker)
  end


  def new
    @worker = Worker.new
    combo_box_all()
    combo_box_type_identification()
  end


  def edit
    combo_box_all()
    combo_box_type_identification()
  end


  def create
    @worker = Worker.new(worker_params)
      if @worker.save
        redirect_to @worker, notice: "Worker was successfully created."
      else
       render :new, status: :unprocessable_entity
       combo_box_all()
       combo_box_type_identification()
      end
  end


  def update
    enable_resources(@worker,params)
      if @worker.update(worker_params)
        redirect_to @worker, notice: "Worker was successfully updated."
      else
        render :edit, status: :unprocessable_entity
        combo_box_all()
        combo_box_type_identification()
     end
  end


  def destroy
    if @worker.destroy
      redirect_to workers_url, notice: "Worker was successfully destroyed."
    end
  end

  private

    def set_worker
      @worker = Worker.find(params[:id])
    end

    def worker_params
      params.require(:worker).permit(:first_name,:last_name,:phone,:phone_2,:email,:profile_id,:profile_2,:profile_3,:profile_4,:identification,:type_identification_id,:enable,:function)
    end
end
