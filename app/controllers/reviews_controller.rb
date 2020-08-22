class ReviewsController < ApplicationController
   def index
      @book = Book.find_by(params[:book_id])
      @reviews = Review.all
   end

   def new 
      @book = Book.find_by(params[:book_id])
      @review = Review.new 
   end 

   def create
      @book = Book.find_by(params[:book_id])
      binding.pry 
   end 

   def show
   end

   def destroy
   end

   private 
   def review_params
      params.permit(:review).permit(:rating, :comment, :book_id, :user_id)
   end
end
