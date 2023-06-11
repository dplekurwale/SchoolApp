class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: -> {params[:controller].split('/')[0] == 'devise_token_auth'}
  before_action :configure_permitted_parameters, if: :devise_controller?

  def access_denied(exception)
    redirect_to new_admin_user_session_path, alert: exception.message
  end

  def after_sign_in_path_for(resource)
    if [Student, User].include?(resource.class)
      return dashboard_path
    end
    super
	end

  def after_sign_up_path_for(resource)
    if [Student, User].include?(resource.class)
      return new_user_session_path
    end
    super
  end

  protected

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :name, :school_id])
  end
end
