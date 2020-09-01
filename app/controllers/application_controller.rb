class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception 
   helper_method :current_user, :logged_in?, :login_and_redirect

   def logged_in?
      current_user ? true : false 
   end 

   def require_login
      redirect_to '/' unless current_user
   end 

   def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end

   def login_and_redirect(user)
      session[:user_id] = user.id
      redirect_to user_path(user)
   end 
end
