class AdminController < ApplicationController
  def login
    session[:seller_id] = nil
    if request.post?
      seller = Seller.authenticate(params[:name], params[:password])
      if seller
        session[:seller_id] = seller.id
        redirect_to(:action => "index" )
      else
        flash.now[:notice] = "Kombinasi nama dan password salah"
      end
    end
  end

  def logout
    session[:seller_id] = nil
    flash[:notice] = "Sudah log out"
    redirect_to(:action => "login")
  end

  def index
    @total_orders = Order.count
  end

end

