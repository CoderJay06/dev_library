class AuthorsController < ApplicationController
  def index
    # show all authors
    @authors = Author.all
  end

  def show
    # show author's profile page
    # binding.pry 
    @author = Author.find_by(id: params[:id])
  end
end
