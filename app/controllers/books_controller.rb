class BooksController < ApplicationController
   def index 
      @books = Book.all 
   end 

   def new 
      @book = Book.new
   end 

   def create
      @book = Book.create(book_params)
      if @book.save
         # if book created successfully, send to book show page
         redirect_to book_path(@book)
      else  
         # otherwise render create book form
         render :new 
      end 
   end 

   def show
      @book = Book.find_by_id(params[:id])
   end 

   private
   def book_params
      params.require(:book).permit(:title, :author, :description, :release_date, :category_name)
   end 
end
