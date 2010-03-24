# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base


  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store

  helper :all # include all helpers, all the time
  protect_from_forgery #:secret # => '7tWDI95y4WTOn4oGQJKSrxkUpJmldD60wexlJu1XvYo'
  before_filter { |c| Authorization.current_user = c.current_user }



  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  helper_method :current_user_session, :current_user


  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  protected

  def permission_denied
    flash[:error] = "Maaf, anda tidak punya akses halaman tersebut"
    redirect_to root_url
  end

end

