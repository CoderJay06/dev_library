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

   def delete
   end 

   def destroy
      # delete a specific author with their books
      author = Author.find_by_id(params[:id])
      author.books.select {|book| book.destroy} 
      author.destroy
      redirect_to authors_path 
   end

   private
   def author_params
      params.require(:author).permit(:name)
   end
end
