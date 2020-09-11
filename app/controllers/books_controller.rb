class BooksController < ApplicationController
   before_action :require_login
   before_action :set_book, only: [:show]
   
   def index 
      @books = Book.all 
   end 

   def show
      # Set array of download format types
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
