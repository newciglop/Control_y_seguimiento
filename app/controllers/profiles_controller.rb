class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]


  def index
    @profiles = Profile.all
    ids = @profiles.ids.first
    @delete_ok = Engineer.where(profile_id: ids).first
    @delete_ok_2 = Engineer.where(profile_two: ids).first
    @delete_ok_3 =  Engineer.where(profile_three: ids).first
  end


  def show
  end


  def new
    @profile = Profile.new
    profile_type()
  end


  def edit
    profile_type()
    @delete_ok = Engineer.where(profile_id: @profile.id).first
    @delete_ok_2 = Engineer.where(profile_two:@profile.id).first
    @delete_ok_3 =  Engineer.where(profile_three:@profile.id).first
  end


  def create
    @profile = Profile.new(profile_params)


      if @profile.save
        redirect_to edit_profile_path(@profile), notice: "Profile was successfully created."
      else
        redirect_to new_profile_path
      end

  end


  def update
       @enable = params[:enable]
       @enable ? @profile.enable = @enable: @profile.enable = false
      if @profile.update(profile_params)
         redirect_to edit_profile_path(@profile), notice: "Profile was successfully updated."
      else
        redirect_to edit_profile_path(@profile), notice: "Algo salio mal"
      end

  end


  def destroy
    if @profile.destroy
         redirect_to profiles_path, notice: "Profile was successfully destroyed."
    else
      redirect_to profiles_path, notice: "Algo salio mal."
    end
  end

  private
  def profile_type
    @profile_type = Profile.PROFILE_TYPE.map{|type| [type[0], type[1]]}
  end
    def set_profile
      @profile = Profile.find(params[:id])
    end


    def profile_params
      params.require(:profile).permit(:name,:enable,:profile_type)
    end
end
