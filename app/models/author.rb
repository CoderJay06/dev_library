class Author < ApplicationRecord
   has_many :books, dependent: :destroy
   validates :name, presence: true
   validates :name, length: { in: 3..40 }

   scope :search, ->(search_term) { where("name LIKE ?", "%#{search_term}%") }
end
