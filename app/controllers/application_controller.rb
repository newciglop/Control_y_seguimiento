class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, unless: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || modalities_path
  end


end
