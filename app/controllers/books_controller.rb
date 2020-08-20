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

   def edit 
      @book = Book.find_by_id(params[:id])
   end 

   def update 
      @book = Book.find_by_id(params[:id])
      @book.update(book_params)
      # @review = Book.reviews.build(rating: params[:rating], comment: params[:comment])
      # if book was updated successfully, send to book show page
      if @book.save 
         redirect_to book_path(@book)
      else  
         # otherwise render the edit form 
         render :edit 
      end 
   end 

   def show
      @book = Book.find_by_id(params[:id])
   end 

   def destroy
      @book = Book.find_by_id(params[:id]).destroy
      redirect_to books_path 
   end 

   def recently_added
      @books = Book.recently_added
      render :index
   end 

   private
   def book_params
      params.require(:book).permit(
         :title, :author, :description, :release_date, :category_name, :reviews_attributes => [:rating, :comment])
   end 
end
