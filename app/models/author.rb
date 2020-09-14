class Author < ApplicationRecord
   has_many :books
   validates :name, presence: true
   validates :name, length: { in: 3..40 }
end
