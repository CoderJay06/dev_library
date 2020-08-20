class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :subscriptions
  has_many :books, through: :subscriptions
  validates :first_name, :last_name, :email, :email_confirmation, 
  :username, :password, :password_confirmation, presence: true
  validates :first_name, :last_name, length: {minimum: 2}
  validates :username, :email, uniqueness: true 
  validates :email, :password_confirmation, confirmation: true
end
