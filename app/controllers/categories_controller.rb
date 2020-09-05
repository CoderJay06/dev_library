class CategoriesController < ApplicationController
   def index
      @categories = Category.all
   end

   def show
      # books for a specific category
      # binding.pry 
      @category_books = Category.find_by(params[:category_id]).books
   end 
end 