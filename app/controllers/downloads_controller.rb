class DownloadsController < ApplicationController
   before_action :require_login 

   def create
      @download = Download.create(user_id: current_user.id,
                                  book_id: params[:id],
                                  count: params[:count],
                                  format: params[:format]
                                  )
      determine_download_success
      # binding.pry
      redirect_to book_path(@download.book)
   end

   private
   def determine_download_success
      if @download.save
         flash[:notice] = "Successfully downloaded #{@download.book.title}"
      else  
         flash[:alert] = "There was an error downloading #{@download.book.title}.."
      end 
   end 
end
