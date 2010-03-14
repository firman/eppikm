class AboutController < ApplicationController
    def about
    @title = "About PPIKM"
  end

  def help
    @title = "Help"
  end

protected

  def authorize
  end

end

