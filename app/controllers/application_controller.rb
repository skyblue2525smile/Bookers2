class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :is_matching_login_user, only: [:edit, :update]

   def after_sign_in_path_for(resource)
    user_path(current_user.id)
    flash[:notice] = "Welcome! You have signed up successfully."
   end

   def after_sign_out_path_for(resource)
    about_path
    flash[:notice] = "Signed out successfully."
   end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end


end

