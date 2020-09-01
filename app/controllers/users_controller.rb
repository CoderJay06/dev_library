class UsersController < ApplicationController
   before_action :require_login, only: [:show]

   # get signup form
   def new 
      @user = User.new
   end 

   # signup user
   def create 
      @user = User.create(user_params)

      if @user.save
         login_and_redirect(@user)
      else
         render :new
      end 
   end 

   def show 
      @user = User.find_by_id(params[:id])
   end 

   private 
   def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
   end 
end
