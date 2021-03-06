class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :rut, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :rut, :photo])
  end

  def default_url_options
    { host: ENV["http://www.lewallet.digital/"] || "localhost:3000" }
  end
end
