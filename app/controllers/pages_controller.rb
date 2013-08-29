class PagesController < ApplicationController
  def index
    @html_class = "home"
  end
  
  def shows
    @html_class = "shows"
    @shows = Show.where('date > ?', 1.day.ago).order("date ASC")
    @title = "Tour Dates"
  end
  
  def music
    @html_class = "shows"
    @songs = Song.all
    @title = "Music"
  end
  
  def photos
    @html_class = "band"
    @photos = Photo.all
    @title = "Media"
  end
  
  def band
    @html_class = "band"
    @title = "The Band"
  end
  
  def contact
    @html_class = "band"
    @title = "Contact"
  end
end
