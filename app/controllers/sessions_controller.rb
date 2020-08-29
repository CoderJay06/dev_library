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
    if google_auth_hash = auth 
      omniauth_email = auth["info"]["email"]
      if user = User.find_by(email: omniauth_email)
        # if user exists, log them in and send to profile page
        session[:user_id] = user.id 
        redirect_to user_path(user)
      else   
        # otherwise create new user
        user = User.new(
        first_name: auth["info"]["name"].split(' ')[0],
        last_name: auth["info"]["name"].split(' ')[1],
        email: auth["info"]["email"],
        username: auth["info"]["email"],
        password: SecureRandom.hex(16)
        )
        if user.save 
          # if user created successfully then sign 
          # them in and send to their profile page
          session[:user_id] = user.id 
          redirect_to user_path(user)
        else  
          # otherwise display errors
          raise user.errors.full_messages.inspect 
        end 
      end 
    end 
  end 

  def home
  end

  private 
  
  def auth 
    request.env['omniauth.auth']
  end 
end



