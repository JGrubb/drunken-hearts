class Song < ActiveRecord::Base
  before_create :default_name
  
  mount_uploader :recording, RecordingUploader
  validates_presence_of :recording
  
  def default_name
    self.title ||= File.basename(recording.filename, '.*').titleize if recording
  end
  
end
