class DesignationsController < ApplicationController
  before_action :set_designation, only: %i[ show edit update destroy ]


  def index
    @designations = Designation.all
  end


  def show
  end


  def new
    find_area()
    find_engineers()
    @designation = Designation.new
  end


  def edit
    find_area()
    find_engineers()
    ids =  HasEngineer.where(designation_id: @designation.id).map{|x| x.engineer_id}
    @engineers_has_name =  Engineer.where(id:ids).map{|x| x.name}
  end


  def create
    @designation = Designation.new(designation_params)
    @designation.engineer_elements = params[:engineer_elements]
    if @designation.save
      @designation.save_engineers
         redirect_to @designation, notice: "Designation was successfully created."
      else
        render :new
      end

  end


  def update

      if @designation.update(designation_params)
        @designation.engineer_elements = params[:engineer_elements]
        @designation.save_engineers
        redirect_to @designation, notice: "Designation was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end

  end


  def destroy
    if @designation.destroy
        redirect_to designations_url, notice: "Designation was successfully destroyed."
    end
  end

  private

    def set_designation
      @designation = Designation.find(params[:id])
    end


  def find_area
    enable = true
    @areas = Area.where(enable: enable).map{|area| [area.name, area.id]}
  end


  def find_engineers
    enable = true
    ids_profile = Profile.where('profile_type=? AND enable=?',Profile.PROFILE_ENGINEER_IN_CHARGE,enable).map{|x| x.id}[0]
    @engineers = Engineer.where(enable:true).where('profile_id=?',ids_profile).map{|engineer| [engineer.name , engineer.id]}
  end



    def designation_params
      params.require(:designation).permit(:code,:activity,:area_id,engineer_elements:[])
    end
end
