class UsersController < ApplicationController
  include ComboBoxHelper
  def index
    @users = User.all
  end

  def new
    combo_box_role
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to users_path, notice: "Admin control was successfully created."
    else
      render :new, status: :unprocessable_entity

    end
  end


  private

  def combo_box_role
    @roles =  [["Administrador",1],["Personal",2]].map{|x| [x[0] ,x[1]]}
  end


  def users_params
    params.require(:user).permit(:email, :password, :role_id ,:password_confirmation)
  end


end