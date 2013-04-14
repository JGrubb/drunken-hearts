class Song < ActiveRecord::Base
  attr_accessible :recording, :title
  mount_uploader :recording, RecordingUploader
end
