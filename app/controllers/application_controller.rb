class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_sign_up_parameters, if: :devise_controller?

  protected

  def configure_sign_up_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [
        :name,
        :address,
        :phone_number,
        :is_venue,
      ])
  end
end
