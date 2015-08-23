class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods  
    
  private

   def authenticate
     authenticate_or_request_with_http_token do |token, options|
       @current_user = User.where(api_key: token).first
     end
   end
   
end
