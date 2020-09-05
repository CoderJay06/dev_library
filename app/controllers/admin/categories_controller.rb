class Admin::CategoriesController < AdminController
  
   def new
      @category = Category.new 
   end 

   def create 
      @category = Category.create(category_params)
      if @category.save
         redirect_to books_path
      else  
         render :new 
      end 
   end 

   private 
   def category_params
      params.require(:category).permit(:name)
   end
end
