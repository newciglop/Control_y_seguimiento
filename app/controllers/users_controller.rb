class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]


  # GET /users or /users.json
  def index
    @full_name = params[:full_name] || ""

    if @full_name != ""
      @users = User.all.where("lower(first_name) like lower(?)","%#{@full_name}%").or(User.where("lower(last_name) like lower(?)","%#{@full_name}%")).or(User.where("lower(email) like lower(?)","%#{@full_name}%")).paginate(page: params[:page], per_page: 30).order('id desc')
    else
      @users = User.all.paginate(page: params[:page], per_page: 30).order('id desc')
    end
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
        redirect_to users_path, notice: "Usuario fue creado existosamente"
      else
        show_role
        format.html { render :new, notice: t('commons.what_wrong') }
      end

  end

  # PATCH/PUT /users/1 or /users/1.json
  def update

    if @user.update(user_params)
         redirect_to users_path, notice: "Usuario fue actualizado existosamente"
    else
      show_role
        render :edit, notice: t('commons.what_wrong')
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
  end

  private

  def show_role
    @roles = [[1,"Administrador"],[2,"Editor"],[3,"Usuario"]].map{|x| [x[1], x[0]]}
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password,:password_confirmation,:current_password,:first_name,:last_name,:deactivated,:role_id)
    end
end
