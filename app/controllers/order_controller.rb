class OrderController < ApplicationController
  def index
        @status = params[:id]
    if @status.blank?
      @status = 'all'
      conditions = nil
    else
      conditions = "status = '#{@status}'"
    end

  end

  def show

    @order = Order.all

  end

  def close
    order = Order.find(params[:id])
    order.close
    flash[:notice] = "Order #{order.id} has been closed"
    redirect_to :action => 'index', :id => 'closed'

  end

end
