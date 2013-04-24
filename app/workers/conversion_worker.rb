class ConversionWorker
  include Sidekiq::Worker

  def perform(song_id)
    song = Song.find song_id
    path = "#{Rails.root}/public#{song.recording_url}"
    ogg = path.gsub(/mp3/, "ogg")
    yup = %x[ffmpeg -i #{path} -acodec libvorbis #{ogg}]
  end
end
