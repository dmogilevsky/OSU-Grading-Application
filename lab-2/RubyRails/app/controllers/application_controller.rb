class ApplicationController < ActionController::Base
  before_action :change_params, if: :devise_controller?
  private
  def change_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end


  def after_sign_in_path_for(resource)
    # Here you can write logic based on roles to return different after sign in paths
    if current_user.role ==='student' or current_user.role ==='instructor'
      student_page_path
    else
      admin_page_path
    end
  end
end


