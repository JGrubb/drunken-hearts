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

require 'spec_helper'

describe Song do

  it "is valid with a title and recording" do
    song = create(:song)
    expect(song).to be_valid
  end

  it "is invalid without a recording" do
    song = build(:song, recording: nil)
    expect(song).to have(1).error_on :recording
  end

end
