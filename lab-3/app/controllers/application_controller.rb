class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :change_params, if: :devise_controller?

  private
  def change_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

end


