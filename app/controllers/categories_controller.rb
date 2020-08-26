class CategoriesController < ApplicationController
   before_action :require_login 
   
   # render form for creating a category
   def new
      @category = Category.new 
   end 

   # create a new category
   def create 
      @category = Category.create(category_params)
      if @category.save
         # if category created successfully, send to homepage
         redirect_to root_url
      else  
         # display errors and render create category form again
         render :new 
      end 
   end 

   private 
   def category_params
      params.require(:category).permit(:name)
   end
end
