# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  recording  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Song < ActiveRecord::Base
  before_create :default_name
  
  mount_uploader :recording, RecordingUploader
  validates_presence_of :recording
  
  def default_name
    self.title ||= File.basename(recording.filename, '.*').titleize if recording
  end
  
end
