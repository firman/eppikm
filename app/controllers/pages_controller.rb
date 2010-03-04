class PagesController < ApplicationController

  def home
    @title = "Home"

     @map = GMap.new("map")
      @map.control_init(:large_map => true,:map_type => false)
      @map.center_zoom_init([-6.203451, 106.903244], 11)


ppikm = GMarker.new([-6.203451, 106.903244],
      :title => "PPIKM building",
      :info_window => "PPIKM building <br />
      @Jatinegara Kaum, Jakarta")

@map.overlay_init(ppikm)

    @products = Product.find_products_for_sale


  end


end

