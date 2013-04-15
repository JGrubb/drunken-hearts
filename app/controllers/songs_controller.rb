class SongsController < ApplicationController
  before_filter :is_user
  
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params[:song])
    @song.title = @song.default_name
    if @song.save
      redirect_to music_path
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      redirect_to music_path, :notice => "Good job."
    else
      redirect_to music_path, :error => "Email and screenshot or GTFO"
    end
  end

  def destroy
    @song = Song.find(params[:id])
    if @song.delete
      redirect_to music_path
    end
  end
end
