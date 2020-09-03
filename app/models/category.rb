class Category < ApplicationRecord
   has_many :books
   validates :name, presence: true, uniqueness: true
   validates :name, length: { in: 3..40 }
end
