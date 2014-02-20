require 'spec_helper'

describe Show do

  it "is valid with a date, venue, and city" do
    show = build :show
    expect(show).to be_valid
  end

  it "is invalid without a date" do
    show = build(:show, date: nil)
    expect(show).to have(1).error_on(:date)
  end

  it "is invalid without a venue" do
    show = build(:show, venue: nil)
    expect(show).to have(1).error_on(:venue)
  end

  it "is invalid without a city" do
    show = build(:show, city: nil)
    expect(show).to have(1).error_on(:city)
  end

  describe "URL Validations" do
    it "is valid with a legit ticket URL" do
      show = build(:show_w_links)
      expect(show).to be_valid
    end

    it "is invalid with a busted ticket link" do
      show = build(:show, tickets_link: "ignoredbydinosaurs.com")
      expect(show).to have(1).error_on(:tickets_link)
    end

    it "is valid with a legit venue URL" do
      show = build(:show_w_links)
      expect(show).to be_valid
    end

    it "is invalid with a busted venue link" do
      show = build(:show, venue_link: "ignoredbydinosaurs.com")
      expect(show).to have(1).error_on(:venue_link)
    end
  end
end
