class DownloadsController < ApplicationController
   # download book selected by user
   def create
      # binding.pry
      # TODO: need to create a new download properly
      @download = Download.new
      @download.user_id = current_user.id
      @download.book_id = Book.find_by(params[:book_id])
      @download.save
   end

   private
   def download_params
      params.require(:download).permit(:user_id, :book_id)
   end
end
