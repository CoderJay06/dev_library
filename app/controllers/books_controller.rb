class BooksController < ApplicationController
   before_action :require_login
   before_action :set_book, only: [:show]
   
   def index 
      @books = Book.all 
   end 

   def search 
      # binding.pry 
      @books = Book.search(params[:search]) if params[:search].present?
   end 

   def show
      @download_formats = ["PDF", "EPUB", "DOC"]
   end 

   def recently_added
      @books = Book.recently_added
      render :index
   end 

   private
   def set_book
      @book = Book.find_by_id(params[:id])
   end
end
