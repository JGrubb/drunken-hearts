# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean          default(FALSE)
#

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
