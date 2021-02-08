class EngineersController < ApplicationController
  before_action :set_engineer, only: %i[ show edit update destroy ]


  def index
    @engineers = Engineer.all
  end


  def show
    profile_two  = @engineer.profile_two
    profile_three  = @engineer.profile_three
    @profile_two = Profile.where('id=?',profile_two).map{|p_two| p_two.name}[0]
    @profile_three = Profile.where('id=?',profile_three).map{|p_three| p_three.name}[0]

  end


  def new

    @engineer = Engineer.new
    profile()
  end


  def edit
    profile()
  end


  def create
    @engineer = Engineer.new(engineer_params)
      if @engineer.save
        redirect_to edit_engineer_path(@engineer), notice: "Engineer was successfully created."
      else
        profile()
         render :new
      end

  end


  def update
    @enable = params[:enable]
    @enable ? @engineer.enable = @enable: @engineer.enable = false
      if @engineer.update(engineer_params)
        redirect_to @engineer, notice: "Engineer was successfully updated."
      else
         render :edit
      end

  end


  def destroy
    @engineer.destroy
      redirect_to engineers_path, notice: "Engineer was successfully destroyed."
  end

  private

  def profile
    enable = true
    @profiles = Profile.where('(profile_type=? AND enable=?) OR ( profile_type = ? AND enable=?)',Profile.PROFILE_ENGINEER_IN_CHARGE,enable,Profile.PROFILE_ENGINEER_ATTENDANT,enable)
    @profiles = @profiles.map{|profile| [profile.name, profile.id]}

    @profiles_three = Profile.where(enable:true).map{|profile| [profile.name, profile.id]}
  end

    def set_engineer
      @engineer = Engineer.find(params[:id])
    end


    def engineer_params
      params.require(:engineer).permit(:name,:email,:phone,:enable,:profile_id,:profile_two,:profile_three)
    end
end
