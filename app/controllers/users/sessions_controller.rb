# frozen_string_literal: true

module Users
  # RegistrationsController
  class SessionsController < Devise::SessionsController
    respond_to :json

    def respond_with(_resource, _options = {})
      render json: {
        user: ActiveModelSerializers::SerializableResource.new(current_user,
                                                               each_serializer: UserSerializer), status: 200, message: 'Sign in successfull'
      }
    end

    def respond_to_on_destroy
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
      current_user = User.find(jwt_payload['sub'])
      if current_user
        render json: { status: 200, message: 'Signed out succesfully' }
      else
        render json: { status: 404, message: 'Signed out fails' }
      end
    end
  end
end
