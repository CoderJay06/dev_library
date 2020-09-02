class BooksController < ApplicationController
   before_action :require_login
   before_action :set_book, only: [:edit, :update, :show]
   
   def index 
      @books = Book.all 
   end 

   def new 
      @book = Book.new
   end 

   def create
      @book = Book.create(book_params)
      if @book.save
         redirect_to book_path(@book)
      else  
         render :new 
      end 
   end 

   def edit 

   end 

   def update 
      @book.update(book_params)

      if @book.save 
         redirect_to book_path(@book)
      else  
         render :edit 
      end 
   end 

   def show

   end 

   def destroy
      delete_book
      redirect_to books_path 
   end 

   def recently_added
      @books = Book.recently_added
      render :index
   end 

   private
   def book_params
      params.require(:book).permit(
         :title, 
         :author, 
         :description, 
         :release_date, 
         :category_name, 
         :reviews_attributes => [:id, :rating, :comment]
      )
   end 

   def set_book
      @book = Book.find_by_id(params[:id])
   end

   def delete_book
      @book = Book.find_by_id(params[:id]).destroy
   end 
end
