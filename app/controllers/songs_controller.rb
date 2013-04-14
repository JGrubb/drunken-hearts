class SongsController < ApplicationController
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

  def delete
  end
end
