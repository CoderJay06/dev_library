class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

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
      redirect_to user_path(@user)
    else 
      # otherwise redirect them back to login
      flash[:alert] = "Could not login"
      redirect_to login_path
    end 
  end

  # logout user
  def destroy
    session.clear
    redirect_to '/'
  end 

  # log users in with google omniauth
  def googleAuth 
    user = User.find_or_create_from_omniauth(auth)
    session[:user_id] = user.id 
    redirect_to user_path(user)
  end 

  def home
  end

  private 
  
  def auth 
    request.env['omniauth.auth']
  end 
end



