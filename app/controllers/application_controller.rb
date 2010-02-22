# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  session :session_key => '_depot_session_id'

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store


  helper :all # include all helpers, all the time
  protect_from_forgery :secret => '7tWDI95y4WTOn4oGQJKSrxkUpJmldD60wexlJu1XvYo'

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  def create
    @user = User.new(params[:user])
     if @user.save
       redirect_to @user
     else
       @title = "Sign up"
       render 'new'
     end
  end


  protected
  def authorize
    unless Seller.find_by_id(session[:seller_id])
      flash[:notice] = "Please log in"
      redirect_to :controller => :admin, :action => :login
    end
  end

end

