class UsersController < ApplicationController
   before_action :require_login, only: [:show]

   # get signup form
   def new 
      @user = User.new
   end 

   # signup user
   def create 
      # create new user 
      @user = User.create(user_params)
      # check if user was created 
      if @user.save
         # login and redirect to user show
         session[:user_id] = @user.id
         redirect_to user_path(@user)
      else
         # binding.pry
         render :new
      end 
   end 

   def show 
      # binding.pry
      @user = User.find_by_id(params[:id])
   end 

   private 
   def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
   end 
end
