class Song < ActiveRecord::Base
  before_create :default_name
  
  attr_accessible :recording, :title
  mount_uploader :recording, RecordingUploader
  validates_presence_of :title, :recording
  
  def default_name
    self.title ||= File.basename(recording.filename, '.*').titleize if recording
  end
  
end
