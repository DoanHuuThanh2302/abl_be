# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[line_id line_name birth_day email phone_number address zip_code name delivery_person_name delivery_zip_code delivery_address delivery_phone_number id_login business_license_front business_license_back document_front document_back])
  end
end
