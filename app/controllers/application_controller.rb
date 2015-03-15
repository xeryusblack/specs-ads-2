class ApplicationController < ActionController::Base
	
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  check_authorization :unless => :devise_controller?

    rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message

end

    before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :role_id) }
  end

def current_ability
      @current_ability ||= Ability.new(current_officer_in_charge)
	end
end
