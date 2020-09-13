class Admin::AuthorsController < ApplicationController
   def new
      # render form to add a new author
      @author = Author.new
   end
 
   def create
      # binding.pry
      # add and persist new author to the db
      @author = Author.create(author_params)
      if @author.save
         # redirect to authors profile page if author created
         redirect_to author_path(@author)
      else  
         # otherwise render author form again
         render :new 
      end 
   end

   def destroy
      # delete a specific author
   end

   private
   def author_params
      params.require(:author).permit(:name)
   end
end
