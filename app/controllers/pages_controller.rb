class PagesController < ApplicationController
  require 'rubygems'
require 'google_geocode'
  def home
    @title = "Home"

     @map = GMap.new("map")
      @map.control_init(:large_map => true,:map_type => false)
      @map.center_zoom_init([41.023849,-80.682053], 10)

  end

  def about
    @title = "About PPIKM"
  end

  def help
    @title = "Help"
  end

end

