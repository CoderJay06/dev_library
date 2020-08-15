class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :subscriptions
  has_many :books, through: :subscriptions
end
