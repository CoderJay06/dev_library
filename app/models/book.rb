class Book < ApplicationRecord
  has_many :reviews
  belongs_to :category
  # has_many Subscriptions
  # has_many Users through: Subscriptions
end
