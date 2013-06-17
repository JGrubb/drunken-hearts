class PagesController < ApplicationController
  def index
    @html_class = "home"
  end
  
  def shows
    @html_class = "shows"
    @shows = Show.where('date > ?', 1.day.ago).order("date ASC")
  end
  
  def music
    @html_class = "shows"
    @songs = Song.all
  end
  
  def photos
    @html_class = "band"
    @photos = Photo.all
  end
  
  def band
    @html_class = "band"
  end
  
  def contact
    @html_class = "band"
  end
end
