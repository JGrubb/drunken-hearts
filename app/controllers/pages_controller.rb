class PagesController < ApplicationController
  def index
    @html_class = "home"
  end
  
  def shows
    @shows = Show.order("date ASC")
  end
end
