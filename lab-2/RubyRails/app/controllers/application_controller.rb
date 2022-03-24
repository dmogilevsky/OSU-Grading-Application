class ApplicationController < ActionController::Base
  before_action :change_params, if: :devise_controller?
  private
  def change_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end


  def after_sign_in_path_for(resource)
    admin_page_path
  end
end


