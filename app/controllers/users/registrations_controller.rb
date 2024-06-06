# frozen_string_literal: true

module Users
  # RegistrationsController
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    def respond_with(resource, _options = {})
      if resource.persisted?
        render json: {
          user: ActiveModelSerializers::SerializableResource.new(resource,
                                                                 each_serializer: UserSerializer), status: 200, message: 'Signed successfull'
        }
      else
        render json: {
          status: { status: 404, message: 'Signed fails' }
        }
      end
    end
  end
end
