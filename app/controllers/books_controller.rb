class BooksController < ApplicationController
   before_action :require_login, :google_books_api
   before_action :set_book, only: [:show]
   
   def index 
      binding.pry
      # book object: @google_books["items"][0]["volumeInfo"]["title"]
      # link: @google_books["items"][0]["selfLink"]
      @books = Book.all 
   end 

   # def search 
   #    # binding.pry 
   #    @books = Book.search(params[:search]) if params[:search].present?
   # end 

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
