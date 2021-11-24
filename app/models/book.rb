class Book < ApplicationRecord
   belongs_to :author
   belongs_to :category
   has_many :reviews, dependent: :destroy
   has_many :downloads, dependent: :destroy
   has_many :users, through: :downloads
   
   validates :title, :author, :description, :release_date, :category, 
   presence: true
   validates :title, :description, uniqueness: true 
   validates :title, :author, length: { in: 3..250 }
   validates :description, length: { maximum: 2000 }
   validates_associated :reviews
   
   scope :search, ->(search_term) { where("title LIKE ?", "%#{search_term}%") }
   scope :recently_added, -> { order(Arel.sql("books.updated_at DESC LIMIT 10")) }
   accepts_nested_attributes_for :reviews, :downloads

   # category name writer for associating a book with a category
   def category_name=(name)
      self.category = Category.find_or_create_by(name: name)
   end 

   def category_name
      self.category ? self.category.name : nil
   end 

   # author name writer for associating a book with it's author
   def author_name=(name)
      self.author = Author.find_or_create_by(name: name)
   end 

   def author_name
      self.author ? self.author.name : nil 
   end  
end
