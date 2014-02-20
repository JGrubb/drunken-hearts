require 'spec_helper'

describe User do

  it "is valid with a good email address" do
    user = create :user
    expect(user).to be_valid
  end

  it "is invalid if that email has already been used" do
    user1 = create(:user, email: "test@example.com" )
    user2 = build(:user, email: "test@example.com" )
    expect(user2).to have(1).error_on :email
  end

end
