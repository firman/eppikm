class StoreController < ApplicationController

  def index
    @title = "Katalog Produk"
    @products = Product.find_products_for_sale
    @cart = find_cart
  end

  def add_to_cart
  begin
    product = Product.find(params[:id])
    @cart = find_cart
    @cart.add_product(product)
    redirect_to_index
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    redirect_to_index("Salah produk")
  end
end
  def empty_cart
    session[:cart] = nil
    redirect_to_index("Keranjang belanjanya sekarang kosong")
  end

private

  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => 'index'
  end

 def find_cart
  session[:cart] ||= Cart.new
 end

end

