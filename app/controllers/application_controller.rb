class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_params, if: :devise_controller?
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
  def user_signed_in?
    !!current_user
  end

  protected
  
  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end 

end
