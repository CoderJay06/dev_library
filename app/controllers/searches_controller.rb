class SearchesController < ApplicationController
   def new
      # binding.pry
      @results = Book.search(params[:search]) + 
      Author.search(params[:search]) if params[:search].present?
   end
end
