class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, format: URI::MailTo::EMAIL_REGEXP, uniqueness: true
  validates :password, length:  { minimum: 15 }
end
