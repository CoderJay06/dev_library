class SessionsController < ApplicationController
  # get login form
  def new
  end

  # login user
  def create
    # binding.pry
    # find user
    @user = User.find_by(username: params[:username])

    # authenticate user data and log them in
    if @user && @user.authenticate(params[:password])
      # log them in and redirect them to their profile page
      session[:user_id] = @user.id 
      # binding.pry
      redirect_to user_path(@user)
    else 

      # otherwise redirect them back to login
      redirect_to login_path
    end 
  end

  # logout user
  def destroy
    session.clear
    redirect_to '/'
  end 

  def home
  end
end
