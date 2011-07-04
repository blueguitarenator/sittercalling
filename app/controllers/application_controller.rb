class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  def logged_in?
    unless current_user
      redirect_to login_url
    end
  end
    
  private
    def current_user_session
      @current_user_session ||= UserSession.find(1)
    end
    
    def current_user
      @current_user ||= current_user_session && current_user_session.record
    end
    
    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to login_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to user_url(current_user)
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      #RAILS_DEFAULT_LOGGER.info("\n\n\n\n\n\n\n\n\n|#{session[:return_to]}|\n\n\n\n\n\n\n\na")
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
  
end
