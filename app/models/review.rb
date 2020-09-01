class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_presence_of :rating, :comment
end
