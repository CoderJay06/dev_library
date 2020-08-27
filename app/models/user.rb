class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :downloads
  has_many :books, through: :downloads
  
  validates :first_name, :last_name, :email, :email_confirmation, 
  :username, :password, :password_confirmation, presence: true
  validates :first_name, :last_name, length: { in: 2..40 }
  validates :password, length: { in: 4..20 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, :email, uniqueness: true 
  validates :email, :password_confirmation, confirmation: true
end
