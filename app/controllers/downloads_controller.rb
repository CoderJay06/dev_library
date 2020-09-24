class DownloadsController < ApplicationController
   before_action :require_login, :find_book, only: [:create] 

   def create
      if already_downloaded(@book)
         flash[:alert] = "This book has already been downloaded!"
      else
         @download = Download.create(
            user_id: current_user.id,
            book_id: @book.id,
            quantity: params[:quantity],
            format: params[:format]
         )
         determine_download_success(@download)
      end 
      redirect_to book_path(@book)
   end

   private
   def determine_download_success(download)
      if download.save
         flash[:notice] = "Successfully downloaded #{download.book.title}"
      else  
         flash[:alert] = "There was an error downloading #{download.book.title}.."
      end 
   end 

   def find_book
      @book = Book.find(params[:id])
   end 

   def already_downloaded(book)
      current_user.books.include?(book)
   end   
end
