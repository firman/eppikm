# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  session :session_key => '_depot_session_id'

  helper :all # include all helpers, all the time
  protect_from_forgery :secret => '7tWDI95y4WTOn4oGQJKSrxkUpJmldD60wexlJu1XvYo'
  # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end

