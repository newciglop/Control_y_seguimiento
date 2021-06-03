class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, unless: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || admin_controls_path
  end

  add_flash_types(:success, :info, :warning, :danger)


  def show_hour(obj)
    objet = obj
    hour = objet[2]
    min = objet[1]
    second= objet[0]
    hour_full = "#{hour}:#{min}:#{second}"
  end


  def redirect_user
    redirect_to '/404'
  end

end
