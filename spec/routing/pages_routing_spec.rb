require 'spec_helper'

describe PagesController do
  describe "routing" do
    it "routes the homepage to pages#index" do
      expect(:get => '/').to route_to('pages#index')
    end

    it "routes show to pages#shows" do
      expect(:get => '/shows').to route_to('pages#shows')
    end

    it "routes music to pages#music" do
      expect(:get => '/music').to route_to('pages#music')
    end

    it "routes media to pages#photos" do
      expect(:get => '/media').to route_to('pages#photos')
    end

    it "routes band to pages#band" do
      expect(:get => '/band').to route_to('pages#band')
    end

    it "routes contact to pages#contact" do
      expect(:get => '/contact').to route_to('pages#contact')
    end
  end
end
