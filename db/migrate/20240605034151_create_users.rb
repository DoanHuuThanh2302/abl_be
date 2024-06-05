# frozen_string_literal: true

# CreateUsers
class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :zip_code
      t.string :address
      t.string :phone_number
      t.string :email
      t.date :birth_day
      t.string :line_name
      t.string :line_id
      t.string :business_license_front
      t.string :business_license_back
      t.string :document_front
      t.string :document_back
      t.string :id_login
      t.string :password
      t.string :delivery_person_name
      t.string :delivery_phone_number
      t.string :delivery_zip_code
      t.string :delivery_address
      t.string :product_detail_template1
      t.string :product_detail_template2
      t.string :product_detail_template3
      t.timestamps
    end
  end
end
