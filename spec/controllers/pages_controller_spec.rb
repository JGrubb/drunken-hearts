require 'spec_helper'

describe PagesController do

  describe "GET index"  do
    
    it "assigns the html body class as @html_class" do
      get :index
      expect(assigns(:html_class)).to eq "home"
    end

  end

  describe "GET shows" do
    
    before :each do
      @show1 = create(:show_w_links)
      @show2 = create(:show_w_links, date: 2.weeks.from_now)
      @past_show = create(:past_show)
      get :shows
    end

    it "assigns the html class as @html_class" do
      expect(assigns(:html_class)).to eq "shows"
    end

    it "assigns all upcoming shows as @shows" do
      expect(assigns(:shows)).to match_array([@show1, @show2])
    end

    it "doesn't display shows that have already passed" do
      expect(assigns(:shows)).to_not include(@past_show)
    end

    it "makes damn sure that only today and future shows get in this list" do
      @show3 = create(:show_w_links, date: Date.today)
      @show4 = create(:show_w_links, date: Date.yesterday)
      expect(assigns(:shows).count).to eq 3
    end

    it "assigns the page title to @title" do
      expect(assigns(:title)).to eq "Tour Dates"
    end

  end

  describe "GET media" do
    
    before :each do
      @photo1 = create :photo
      @photo2 = create :photo
      @photo3 = create :photo
      get :photos
    end 

    it "assigns the html class to @html_class"do
      expect(assigns(:html_class)).to eq "band"
    end

    it "assigns photos to @photos" do
      expect(assigns(:photos)).to match_array([@photo1, @photo2, @photo3])
    end

    it "assigns the page title to @title" do
      expect(assigns(:title)).to eq "Media"
    end
  end

  describe "GET band" do

    before :each do
      get :band
    end

    it "assigns the html class to @html_class" do
      expect(assigns(:html_class)).to eq "band"
    end

    it "assigns the page title to @title" do
      expect(assigns(:title)).to eq "The Band"
    end
  end

  describe "GET contact" do

    before :each do
      get :contact
    end

    it "assigns the html class to @html_class" do
      expect(assigns(:html_class)).to eq "band"
    end

    it "assigns the page title to @title" do
      expect(assigns(:title)).to eq "Contact"
    end
  end
end
