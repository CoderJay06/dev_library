class Admin::AuthorsController < ApplicationController
   before_action :set_author, except: [:new, :delete]
   def new
      @author = Author.new
   end
 
   def create
      @author = Author.create(author_params)
      if @author.save
         redirect_to author_path(@author)
      else  
         render :new 
      end 
   end

   def edit
   end

   def update
      if @author.update(author_params)
         @author.save
         redirect_to author_path(@author)
      else
         render :edit 
      end 
   end 

   def delete
   end 

   def destroy
      author.books.select {|book| book.destroy} 
      author.destroy
      redirect_to authors_path 
   end

   private
   def author_params
      params.require(:author).permit(:name)
   end

   def set_author 
      @author = Author.find_by_id(params[:id])
   end 
end
