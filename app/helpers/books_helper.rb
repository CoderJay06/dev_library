module BooksHelper
   def display_books_heading(book)
      if @books == Book.recently_added 
         "Recently added books"
      else 
         "Books Index"
      end 
   end 

   def display_download_success_message
      if flash[:notice] 
         flash[:notice] 
      else 
         flash[:alert] 
      end
   end 
end
