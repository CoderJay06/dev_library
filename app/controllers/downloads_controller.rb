class DownloadsController < ApplicationController
   before_action :require_login 

   # download book selected by user
   def create
      # binding.pry
      # TODO: need to create a new download properly
      @download = Download.create(user_id: current_user.id,
                                  book_id: params[:id])
      if @download.save
         flash[:notice] = "Successfully downloaded #{@download.book.title}"
         redirect_to book_path(@download.book)
      else  
         flash[:alert] = "There was an error downloading #{@download.book.title}.."
         redirect_to book_path(@download.book)
      end 
   end

   private
   def download_params
      params.require(:download).permit(:user_id, :book_id)
   end
end
