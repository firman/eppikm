class StoreController < ApplicationController


  before_filter :find_cart, :except => :empty_cart

  def index
    @title = "Katalog Produk"
    @products = Product.find_products_for_sale
    @cart = find_cart
  end

  def add_to_cart
      begin
      product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}" )
      redirect_to_index("Invalid product" )
    else
      @current_item = @cart.add_product(product)
      if request.xhr?
         respond_to { |format| format.js }
      else
         redirect_to_index
      end
    end
  end

  def checkout
    @cart = find_cart
    if @cart.items.empty?
      redirect_to_index("cart anda kosong")
    else
      @order = Order.new
    end
  end

  def save_order
    @cart = find_cart
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    if @order.save
      session[:cart] = nil
      redirect_to_index("Terima kasih atas ordernya")
    else
      render :action => 'checkout'
    end
  end

  def empty_cart
    session[:cart] = nil
    redirect_to_index("Cart anda sekarang kosong")
  end

private

  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => 'index'
  end

 def find_cart
  @cart = (session[:cart] ||= Cart.new)
 end

end

