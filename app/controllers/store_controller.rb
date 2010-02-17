class StoreController < ApplicationController
  def index
    @title = "Katalog"
    @products = Product.find_products_for_sale
  end

end

