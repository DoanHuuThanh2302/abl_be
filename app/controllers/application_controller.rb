# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  before_action :authenticate_user, if: :token_present?

  private

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    nil unless token && valid_token?(token)
  end

  def token_present?
    request.headers['Authorization'].present?
  end

  def valid_token?(token)
    decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base)
    user_id = decoded_token[0]['user_id']
    @current_user = User.find_by(id: user_id)
    @current_user.present?
  end

  attr_reader :current_user
end
