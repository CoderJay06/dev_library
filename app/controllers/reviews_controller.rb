class ReviewsController < ApplicationController
   before_action :require_login 

   def new 
      # binding.pry 
      # @book = Book.find(params[:book_id])
      # @review = @book.reviews.build
      @book = Book.find(params[:book_id])
      @review = @book.reviews.build
   end 

   def create
      # binding.pry 
      @book = Book.find(params[:book_id])
      @review = @book.reviews.build(review_params)
      @review.user_id = current_user.id
      # @review.save
      # binding.pry
      if @review && @review.valid?
         @review.save
         redirect_to book_path(@book)
      else  
         # redirect_to new_book_review_path(@book)
         render :new
      end 
      # binding.pry 
   end 

   # GET "/books/1/reviews/1/edit"
   def edit 
      # binding.pry 
      @book = Book.find(params[:book_id])
      # @review = Review.find(params[:id])
      @review = Review.find(params[:id])
   end 

   # PATCH "/books/1/reviews/1/edit"
   def update 
      @book = Book.find(params[:book_id])
      @review = Review.find(params[:id])

      # update current user's review 
      if @review.user_id == current_user.id
         if @review.update(review_params)
            # binding.pry 
            redirect_to book_path(@book)
         else  
            render :edit 
         end 
      end 
   end 

   def destroy
      # remove review made by current user
      # binding.pry 
      review = Review.find(params[:id])
      book = Book.find(review.book_id)

      # set review's owner to the current user
      if review.user_id == current_user.id 
         review.destroy
      end 

      redirect_to book_path(book)
   end

   # GET "/users/1/reviews"
   def show
      # binding.pry
      @user = User.find_by_id(current_user.id)
   end 

   private 
   def review_params
      params.require(:review).permit(:rating, :comment, :book_id, :user_id)
   end
end
