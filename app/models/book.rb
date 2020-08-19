class Book < ApplicationRecord
   has_many :reviews
   belongs_to :category
   has_many :subscriptions
   has_many :users, through: :subscriptions
   validates :title, :author, :description, :release_date, :category, 
   presence: true
   scope :recently_added, -> { order("books.updated_at DESC") }
   accepts_nested_attributes_for :reviews 

   # category name writer for associating a book with a category
   def category_name=(name)
      self.category = Category.find_or_create_by(name: name)
   end 

   def category_name
      self.category ? self.category.name : nil
   end 

   # def reviews 
   #    self.reviews 
   # end 

   # def reviews_attributes=(attr)
   #    # process attributes hash
   # end    
end

