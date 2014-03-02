require 'spec_helper'

describe SongsController do
  describe "songs routing" do
    it "routes to #new" do
      expect(:get => 'songs/new').to route_to('songs#new')
    end

    it "routes to #edit" do
      expect(:get => 'songs/1/edit').to route_to('songs#edit', :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => 'songs/1').to route_to('songs#destroy', :id => "1")
    end

    it "routes to #update" do
      expect(:put => 'songs/1').to route_to('songs#update', :id => "1")
    end

    it "routes to #create" do
      expect(:post => 'songs').to route_to(:controller => "songs", :action => "create")
    end

    it "does not route to #index" do
      expect(:get => 'songs').to_not be_routable
    end

    it "does not route to #show" do
      expect(:get => 'songs/1').to_not be_routable
    end
  end
end
