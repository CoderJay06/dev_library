class DownloadsController < ApplicationController
   before_action :require_login 

   def create
      @download = Download.create(user_id: current_user.id,
                                  book_id: params[:id])
      determine_download_success_and_redirect
   end

   private

   def determine_download_success_and_redirect
      if @download.save
         flash[:notice] = "Successfully downloaded #{@download.book.title}"
         redirect_to book_path(@download.book)
      else  
         flash[:alert] = "There was an error downloading #{@download.book.title}.."
         redirect_to book_path(@download.book)
      end 
   end 
end
