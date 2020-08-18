class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :subscriptions
  has_many :books, through: :subscriptions
  validates :first_name, :last_name, :email, :username, :password,
    presence: true
  validates :username, :email, uniqueness: true 
end
