class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]


  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    show_role
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    show_role
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @user.password_conf
      if @user.save
        redirect_to @user, notice: "User was successfully created."
      else
        show_role
        format.html { render :new, status: :unprocessable_entity }
      end

  end

  # PATCH/PUT /users/1 or /users/1.json
  def update

    if @user.update(user_params)
         redirect_to @user, notice: "User was successfully updated."
    else
      show_role
        render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
  end

  private

  def show_role
    @roles = [[1,"Administrador"],[2,"editor"],[3,"observador"]].map{|x| [x[1], x[0]]}
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password,:password_confirmation,:current_password,:first_name,:last_name,:deactivated)
    end
end
