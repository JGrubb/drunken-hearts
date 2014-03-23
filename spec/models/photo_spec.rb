# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  caption    :string(255)
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Photo do

  it "is valid with an image" do
    photo = create(:photo)
    expect(photo).to be_valid
  end

  it "is invalid without an image" do
    photo = build(:photo, image: nil)
    expect(photo).to have(1).error_on :image
  end

end
