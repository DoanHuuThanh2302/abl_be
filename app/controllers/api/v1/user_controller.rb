# frozen_string_literal: true

module Api
  module V1
    class UserController < ApplicationController
      def create
        @user = User.new(user_params)
        if @user.save
          render json: { message: 'ok', status: 200 }
        else
          render json: { message: 'not ok', status: 404 }
        end
      end

      private

      def user_params
        params.require(:user).permit(:line_id, :line_name, :birth_day, :email, :phone_number, :address, :zip_code, :name, :delivery_person_name, :delivery_zip_code, :delivery_address, :delivery_phone_number, :id_login, :password)
      end
    end
  end
end
