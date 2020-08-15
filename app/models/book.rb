class Book < ApplicationRecord
   has_many :reviews
   belongs_to :category
   has_many :subscriptions
   has_many :users, through: :subscriptions
end
