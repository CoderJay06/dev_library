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
      binding.pry 
      redirect_to book_path(@book)
      # binding.pry 
   end 

   def show
   end

   def destroy
   end

   private 
   def review_params
      params.require(:review).permit(:rating, :comment, :book_id, :user_id)
   end
end
