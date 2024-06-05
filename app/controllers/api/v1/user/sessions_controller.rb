# frozen_string_literal: true

module Api
  module V1
    module User
      # SessionsController
      class SessionsController < ApplicationController
        require 'jwt'
        def login
          @user = User.find_by(email: params[:user][:email])
          if @user&.authenticate(params[:user][:password])

            expiration_time = Time.now.to_i + (48 * 3600)
            payload = { user_id: @user.id, exp: expiration_time }
            token = JWT.encode(payload, Rails.application.credentials.secret_key_base, 'HS256')
            render json: { user: ActiveModelSerializers::SerializableResource.new(@user,
                                                                                  each_serializer: UsersSerializer), status: 200, token: }
          else
            render json: { message: 'メールアドレス、又はパスワードが間違っています。', status: 404 }
          end
        end

        def logout
          if current_user
            render json: {
              status: { code: 200, message: 'ログアウトされました。' }
            }, status: :ok
          else
            render json: {
              status: { code: 401, message: 'ログアウトできません。' }
            }, status: :unauthorized
          end
        end
      end
    end
  end
end
