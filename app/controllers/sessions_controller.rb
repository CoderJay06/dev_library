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

  def googleAuth # log users in with google omniauth
    # get access tokens from google server
    # binding.pry
    user = User.find_or_create_by(email: auth['info']['email']) do |user|
        random_password = SecureRandom.hex(16);
        user.first_name = auth["info"]["name"].split(' ')[0]
        user.last_name = auth["info"]["name"].split(' ')[1]
        user.email = auth["info"]["email"]
        user.email_confirmation = auth["info"]["email"]
        user.username = auth["info"]["email"]
        user.password = random_password
        user.password_confirmation = random_password
    end 
    # binding.pry 

    if user.valid?
      # if user created successfully log them in and 
      # send them to their profile
      session[:user_id] = user.id 
      redirect_to user_path
    else
      # otherwise, display error messages and 
      # redirect them back to homepage
      flash[:alert] = user.errors.full_messages
      redirect_to root_path
    end 
  end 

  def home
  end

  private 
  
  def auth 
    request.env['omniauth.auth']
  end 
end



