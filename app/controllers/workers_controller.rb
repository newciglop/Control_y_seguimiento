class WorkersController < ApplicationController
  include ComboBoxHelper
  include WorkersHelper
  include Deleteable
  include Icons
  before_action :set_worker, only: %i[ show edit update destroy ]

  def index
    show_icons
    @search = params[:search] || ""
    @workers = Worker.where("(LOWER(first_name) like LOWER(?) OR LOWER(last_name) like LOWER(?) OR LOWER(identification) like LOWER(?)) " ,"%#{@search}%","%#{@search}%","%#{@search}%")
                   .paginate(page: params[:page], per_page: 30).order('id desc')

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
    combo_box_all()
    combo_box_type_identification()
    @worker = Worker.new(worker_params)
      if @worker.save
        redirect_to @worker, notice: t('workers.worker') + " " + t('commons.create_success')
      else
       render :new, notice: t('workers.worker') + " " + t('commons.what_wrong')
       combo_box_all()
       combo_box_type_identification()
      end
  end


  def update
    combo_box_all()
    combo_box_type_identification()
    enable_resources(@worker,params)
      if @worker.update(worker_params)
        redirect_to @worker, notice: t('workers.worker') + " " + t('commons.update_success')
      else
        render :edit, notice: t('workers.worker') + " " + t('commons.what_wrong')
        combo_box_all()
        combo_box_type_identification()
     end
  end


  def destroy
    delete_with_references(@worker,workers_path)
  end

  private

    def set_worker
      @worker = Worker.find(params[:id])
    end

    def worker_params
      params.require(:worker).permit(:first_name,:last_name,:phone,:phone_2,:email,:profile_id,:profile_2,:profile_3,:profile_4,:identification,:type_identification_id,:enable,:function)
    end
end
