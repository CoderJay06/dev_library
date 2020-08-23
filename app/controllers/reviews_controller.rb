class ReviewsController < ApplicationController
   def index
      @book = Book.find_by(params[:book_id])
      @reviews = @book.reviews
   end

   def new 
      @book = Book.find_by(params[:book_id])
      @review = Review.new
   end 

   def create
      @book = Book.find_by(params[:book_id])
      @review = @book.reviews.build(review_params)
      @review.user_id = current_user.id
      @review.save
      
      redirect_to book_path(@book)
      # binding.pry 
   end 

   def destroy
      # remove review made by current user
      review = Review.find_by(params[:id]) 
      if review.user_id == current_user.id 
         review.destroy
      end 

      redirect_to book_path
   end

   private 
   def review_params
      params.require(:review).permit(:rating, :comment, :book_id, :user_id)
   end
end
