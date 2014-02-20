require 'spec_helper'

describe User do

  it "is valid with a good email address" do
    user = create :user
    expect(user).to be_valid
  end

  it "is invalid if that email has already been used" do
    user1 = create(:user)
    user2 = build(:user)
    expect(user2).to have(1).error_on :email
  end

end
