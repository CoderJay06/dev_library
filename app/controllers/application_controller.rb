class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception 
   helper_method :current_user, 
                 :admin?,
                 :logged_in?, 
                 :homepage, 
                 :google_books_api,
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

   def google_books_api
      # test api key for google books
      url = "https://www.googleapis.com/books/v1/volumes?q=subject:computer-science&printType=books&key=#{ENV["API_KEY"]}"
      response = HTTParty.get(url)
      @google_books = response.parsed_response
   end 

   def admin?
      current_user.admin?
   end 

   def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end

   def login_and_redirect(user)
      session[:user_id] = user.id
      redirect_to user_path(user)
   end 
end
