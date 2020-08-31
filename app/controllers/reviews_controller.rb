class ReviewsController < ApplicationController
   before_action :require_login 

   def new 
      @book = Book.find_by(params[:book_id])
      @review = @book.reviews.build
   end 

   def create
      @book = Book.find_by(params[:book_id])
      @review = @book.reviews.build(review_params)
      @review.user_id = current_user.id
      # binding.pry
      if @review.save
         redirect_to book_path(@book)
      else  
         flash[:alert] = "Sorry, could not write a new review."
         redirect_to new_book_review_path(@book)
      end 
      # binding.pry 
   end 

   # GET "/books/1/reviews/1/edit"
   def edit 
      @book = Book.find_by(params[:book_id])
      @review = Review.find_by(user_id: current_user.id)
   end 

   # PATCH "/books/1/reviews/1/edit"
   def update 
      book = Book.find_by(params[:book_id])
      review = Review.find_by(user_id: current_user.id)

      # update current user's review 
      if review.user_id == current_user.id
         if review.update(review_params)
            redirect_to book_path(book)
         end 
      end 
   end 

   def destroy
      # remove review made by current user
      review = Review.find_by(user_id: current_user.id)

      # set review's owner to the current user
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
