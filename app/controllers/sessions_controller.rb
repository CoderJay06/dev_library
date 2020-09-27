class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def home
  end

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    authenticate_and_login(@user)
  end

  def destroy
    logout 
    redirect_to homepage 
  end 

  def googleAuth 
    user = User.find_or_create_from_omniauth(auth)
    login_and_redirect(@user)
  end 

  private 
  def auth 
    request.env['omniauth.auth']
  end 

  def authenticate_and_login(user)
    if @user && @user.authenticate(params[:password])
      login_and_redirect(@user)
    else 
      redirect_to_login_if_not_authenticated
    end 
  end 

  def redirect_to_login_if_not_authenticated
    flash[:alert] = "Could not login"
    redirect_to login_path
  end 
end