class NavigatorsController < ApplicationController





  def create_user


    show_role
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password  = params[:password]
    password_confirmation = params[:password_confirmation]
    role_id = params[:role_id]
    deactivated = params[:deactivated]

    puts "#{password_confirmation.to_s} _ #{password}"
    if password.to_s == password_confirmation.to_s
    user = User.new(email: email,password: password,
                    password_confirmation: password_confirmation,role_id: role_id,
                    deactivated: deactivated,first_name: first_name,last_name: last_name)
    if user.save
      redirect_to users_path, notice: "Usuario creado exitosamente"
    end
    else
      flash[:alert] = "confirme su contraseña"
    end


  end




  private

  def show_role
    @roles = [[1,"Administrador"],[2,"Editor"],[3,"Usuario"]].map{|x| [x[1], x[0]]}
  end

end
