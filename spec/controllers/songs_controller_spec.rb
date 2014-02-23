require 'spec_helper'

describe SongsController do

  describe "songs routing" do
    it "routes to #new" do
      expect(:get => 'songs/new').to route_to(:controller => "songs", :action => "new")
    end

    it "routes to #edit" do
      expect(:get => 'songs/1/edit').to route_to(:controller => "songs", :action => "edit", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => 'songs/1').to route_to(:controller => "songs", :action => "destroy", :id => "1")
    end

    it "routes to #update" do
      expect(:put => 'songs/1').to route_to(:controller => "songs", :action => "update", :id => "1")
    end

    it "routes to #create" do
      expect(:post => 'songs').to route_to(:controller => "songs", :action => "create")
    end

    it "does not route to #index" do
      expect(:get => 'songs').to_not route_to(:controller => "songs", :action => "index")
    end

    it "does not route to #show" do
      expect(:get => 'songs/1').to_not route_to(:controller => "songs", :action => "show", :id => "1")
    end
  end
end
