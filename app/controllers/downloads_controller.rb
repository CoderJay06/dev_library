class DownloadsController < ApplicationController
   before_action :require_login 

   def create
      @download = Download.create(user_id: current_user.id,
                                  book_id: params[:id])
      # binding.pry 
      determine_download_success
      redirect_to book_path(@download.book)
   end

   private
   # def download_params
   #    params.require(:download).permit(:format)
   # end

   def determine_download_success
      if @download.save
         flash[:notice] = "Successfully downloaded #{@download.book.title}"
      else  
         flash[:alert] = "There was an error downloading #{@download.book.title}.."
      end 
   end 
end
