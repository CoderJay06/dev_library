class DownloadsController < ApplicationController
   # download book selected by user
   def create
      # binding.pry
      # TODO: need to create a new download properly
      @book = Book.find_by(params[:book_id])
      @download = Download.create(user_id: current_user.id,
                                  book_id: @book.id)
      if @download.save
         flash[:notice] = "Successfully downloaded #{@book.title}"
         redirect_to book_path(@book)
      else  
         flash[:alert] = "There was an error downloading #{@book.title}.."
         redirect_to book_path(@book)
      end 
   end

   private
   def download_params
      params.require(:download).permit(:user_id, :book_id)
   end
end
