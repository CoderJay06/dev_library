class Book < ApplicationRecord
  # has_many Reviews
  belongs_to :category
  # has_many Subscriptions
  # has_many Users through: Subscriptions
end
