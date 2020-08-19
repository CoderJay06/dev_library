class Book < ApplicationRecord
   has_many :reviews
   belongs_to :category
   has_many :subscriptions
   has_many :users, through: :subscriptions
   validates :title, :author, :description, :release_date, :category, 
   presence: true

   # category name writer for associating a book with a category
   def category_name=(name)
      self.category = Category.find_or_create_by(name: name)
   end 

   def category_name
      self.category ? self.category.name : nil
   end 
end

