class ReviewsController < ApplicationController
   before_action :require_login, 
                 :set_book, only: [:new, :create, :edit, :update]
   before_action :set_review, only: [:edit, :update]

   def new 
      @review = @book.reviews.build
   end 

   def create
      @review = @book.reviews.build(review_params)
      @review.user_id = current_user.id

      if @review && @review.valid?
         @review.save
         redirect_to book_path(@book)
      else  
         render :new
      end 
   end 

   # GET "/books/1/reviews/1/edit"
   def edit 
   end 

   # PATCH "/books/1/reviews/1/edit"
   def update 
      if current_user_made(@review)
         if @review.update(review_params)
            redirect_to book_path(@book)
         else  
            render :edit 
         end 
      end 
   end 

   def destroy
      review = Review.find(params[:id])
      book = Book.find(review.book_id)

      if current_user_made(review)
         review.destroy
      end 
      redirect_to book_path(book)
   end

   # GET "/users/1/reviews"
   def show
      @user = User.find_by_id(current_user.id)
   end 

   private 
   def review_params
      params.require(:review).permit(:rating, :comment, :book_id, :user_id)
   end

   def set_book
      @book = Book.find(params[:book_id])
   end 

   def set_review
      @review = Review.find(params[:id])
   end 

   def current_user_made(review)
      review.user_id == current_user.id
   end 
end
