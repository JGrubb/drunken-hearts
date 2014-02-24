class SongsController < ApplicationController
  before_filter :is_admin?
  
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.title = @song.default_name unless @song.title
    if @song.save
      ConversionWorker.perform_async(@song.id)
#logger.debug path
      redirect_to music_path
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to music_path, :notice => "Good job."
    else
      redirect_to music_path, :error => "Email me about this, plz"
    end
  end

  def destroy
    @song = Song.find(params[:id])
    if @song.delete
      redirect_to music_path
    else
      redirect_to music_path, :error => "Email me about this, plz"
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :recording)
  end

end
