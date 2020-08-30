class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :downloads
  has_many :books, through: :downloads
  
  validates :first_name, :last_name, :email, :username, 
  :password, presence: true
  validates_confirmation_of :email, :password, unless: 
  Proc.new { |u| u.provider.blank? }
  validates :first_name, :last_name, length: { in: 1..40 }
  validates :password, length: { in: 4..50 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, :email, uniqueness: true 
  validates :email, :password_confirmation, confirmation: true
end
