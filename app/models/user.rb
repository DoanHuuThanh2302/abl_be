# frozen_string_literal: true

# Model User
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self
  mount_uploader :business_license_front, CustomizeDocumentsUploader
  mount_uploader :business_license_back, CustomizeDocumentsUploader
  mount_uploader :document_front, CustomizeDocumentsUploader
  mount_uploader :document_back, CustomizeDocumentsUploader
  validates :email, presence: true, length: { maximum: 200, minimum: 6 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  validates :password, presence: { if: :password_required? }
  validates :name, presence: true, length: { maximum: 50 }
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :birth_day, presence: true
  validates :line_name, presence: true
  validates :line_id, presence: true, uniqueness: true
  validates :id_login, presence: true, uniqueness: true

  validates :business_license_front, presence: true
  validates :business_license_back, presence: true
  validates :document_front, presence: true
  validates :document_back, presence: true
  validates :delivery_person_name, presence: true
  validates :delivery_phone_number, presence: true
  validates :delivery_zip_code, presence: true
  validates :delivery_address, presence: true

  validate :birth_day_must_be_in_the_past

  private

  def birth_day_must_be_in_the_past
    errors.add(:birth_day, 'must be in the past') if birth_day.present? && birth_day >= Date.today
  end

  def jwt_payload
    super.merge('foo' => 'bar')
  end
end
