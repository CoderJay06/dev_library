module BooksHelper
   def display_books_heading(book)
      if @books == Book.recently_added 
         "Recently added books"
      else 
         "Books Index"
      end 
   end 

end
