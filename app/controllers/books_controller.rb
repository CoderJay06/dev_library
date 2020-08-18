class BooksController < ApplicationController
   def index 
      @books = Book.all 
   end 

   def new 
      @book = Book.new
   end 

   def create
      @book = Book.create(book_params)
      binding.pry
   end 

   private
   def book_params
      params.require(:book).permit(:title, :author, :description, :release_date, :category)
   end 
end
