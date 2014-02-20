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
