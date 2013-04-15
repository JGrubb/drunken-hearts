class SongsController < ApplicationController
  before_filter :is_user
  
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params[:song])
    if @song.save
      redirect_to music_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @song = Song.find(params[:id])
    if @song.delete
      redirect_to music_path
    end
  end
end
