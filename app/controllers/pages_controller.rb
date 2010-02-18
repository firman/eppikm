class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def about
    @title = "About PPIKM"
  end

  def help
    @title = "Help"
  end

end

