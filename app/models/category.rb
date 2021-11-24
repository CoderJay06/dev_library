class Category < ApplicationRecord
   has_many :books, dependent: :destroy
   validates :name, presence: true
   validates :name, length: { in: 3..40 }
end
