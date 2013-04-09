class PagesController < ApplicationController
  def index
    @html_class = "home"
  end
  
  def shows
    @html_class = "shows"
    @shows = Show.order("date ASC")
  end
  
  def band
    @html_class = "band"
  end
end
