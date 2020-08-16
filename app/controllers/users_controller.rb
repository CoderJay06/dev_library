class UsersController < ApplicationController
   # get signup form
   def new 
      @user = User.new
   end 

   # signup user
   def create 
      raise params.inspect
   end 
end
