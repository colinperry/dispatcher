class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

protected

def configure_permitted_parameters

	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
		:avatar, :email, :password, :password_confirmation, :current_password, :address, :description, :is_rn, :is_self, :fname, :lname)}

	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
		:avatar, :email, :password, :password_confirmation, :current_password, :address, :description)}
end

def after_sign_in_path_for(resource)
  session[:previous_url] || search_path
end

end