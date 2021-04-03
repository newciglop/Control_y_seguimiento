class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]


  def index
    @profiles = Profile.all
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
  end


  def create

    @profile = Profile.new(profile_params)


      if @profile.save
        redirect_to edit_profile_path(@profile), notice: "Profile was successfully created."
      else
        profile_type()
        render :new, status: :unprocessable_entity
      end

  end


  def update
       @enable = params[:enable]
       @enable ? @profile.enable = @enable: @profile.enable = false
      if @profile.update(profile_params)
         redirect_to edit_profile_path(@profile), notice: "Profile was successfully updated."
      else
        profile_type()
        render :edit, status: :unprocessable_entity
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
    @profile_type = Profile.PROFILE_TYPE.map{|type| [type[0], type[1]]}.sort
  end
    def set_profile
      @profile = Profile.find(params[:id])
    end


    def profile_params
      params.require(:profile).permit(:name,:enable,:profile_type)
    end
end
