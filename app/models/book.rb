class Book < ApplicationRecord
   has_many :reviews
   belongs_to :category
   has_many :subscriptions
   has_many :users, through: :subscriptions
   validates :title, :author, :description, :release_date, :category, 
   presence: true
   validates :title, :author, length: { in: 3..50 }
   validates :description, length: { maximum: 500 }
   validates_associated :reviews 
   scope :recently_added, -> { order("books.updated_at DESC") }
   accepts_nested_attributes_for :reviews 

   # category name writer for associating a book with a category
   def category_name=(name)
      self.category = Category.find_or_create_by(name: name)
   end 

   def category_name
      self.category ? self.category.name : nil
   end 

   # def reviews_attributes=(reviews_hashes)
   #    # process attributes hash
   #    # {"rating" => "", "comment" => ""}
   #    # raise reviews_hashes.inspect
   #    # binding.pry
   #    self.reviews.build(rating: reviews_hashes[:rating], comment: reviews_hashes[:comment]).save
   # end    
end