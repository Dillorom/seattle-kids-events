class ApplicationController < ActionController::Base
    protect_from_forgery
  
    protected
  
    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end
  
    def logged_in
      !!current_user
    end
    
    helper_method :current_user, :logged_in
  
    def current_user=(user)
      @current_user = user
      session[:user_id] = user.nil? ? user : user.id
    end
end
