module SessionsHelper
   def display_validation_alert_if_error
      if flash[:alert]
         flash[:alert]
      end
   end 
end
