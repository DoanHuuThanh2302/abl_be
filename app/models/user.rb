# frozen_string_literal: true

# Model User
class User < ApplicationRecord
  validates :name,  presence: true, uniqueness: true, length: { maximum: 200 }
  validates :email, presence: true, length: { maximum: 200, minimum: 6 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :phone_number, presence: true
  validates :password, presence: true
end
