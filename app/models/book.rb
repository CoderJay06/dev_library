class Book < ApplicationRecord
   belongs_to :author
   belongs_to :category
   has_many :reviews
   has_many :downloads
   has_many :users, through: :downloads
   
   validates :title, :author, :description, :release_date, :category, 
   presence: true
   validates :title, :author, length: { in: 3..50 }
   validates :description, length: { maximum: 500 }
   validates_associated :reviews
   
   scope :recently_added, -> { order("books.updated_at DESC LIMIT 10") }
   accepts_nested_attributes_for :reviews, :downloads

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