# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "store"

  before_filter :authorize, :except => :login
  session :session_key => '_depot_session_id'

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store


  helper :all # include all helpers, all the time
  protect_from_forgery :secret => '7tWDI95y4WTOn4oGQJKSrxkUpJmldD60wexlJu1XvYo'

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password


  protected

  def authorize
    unless Seller.find_by_id(session[:seller_id])
      flash[:notice] = "Silahkan log in"
      redirect_to :controller => :admin, :action => :login
    end
  end

end

