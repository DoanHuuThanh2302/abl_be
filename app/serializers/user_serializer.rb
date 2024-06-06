# frozen_string_literal: true

# UserSerializer
class UserSerializer < ActiveModel::Serializer
  attributes :id, :line_id, :line_name, :birth_day, :email, :phone_number, :address, :zip_code, :name,
             :delivery_person_name, :delivery_zip_code, :delivery_address, :delivery_phone_number,
             :id_login
end
