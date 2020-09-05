class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception 
   helper_method :current_user, 
                 :logged_in?, 
                 :homepage, 
                 :login_and_redirect, 
                 :require_login,
                 :logout

   def logged_in?
      current_user ? true : false 
   end 

   def logout 
      session.clear
   end 

   def require_login
      redirect_to homepage unless current_user
   end 

   def homepage
      root_url
   end 

   def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end

   def login_and_redirect(user)
      session[:user_id] = user.id
      redirect_to user_path(user)
   end 
end
