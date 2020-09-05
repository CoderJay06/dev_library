class AdminController < ApplicationController
   before_action :require_login, :require_admin 
   
   def require_admin
      redirect_to homepage unless current_user.admin?
   end 
end
