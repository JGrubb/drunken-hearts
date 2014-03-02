require 'spec_helper'

describe PhotosController do
  describe "photos routing" do
    it "routes to #new" do
      expect(:get => 'photos/new').to route_to('photos#new')
    end

    it "routes to #edit" do
      expect(:get => 'photos/1/edit').to route_to('photos#edit', :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => 'photos/1').to route_to('photos#destroy', :id => "1")
    end

    it "routes to #update" do
      expect(:put => 'photos/1').to route_to('photos#update', :id => "1")
    end

    it "routes to #create" do
      expect(:post => 'photos').to route_to('photos#create')
    end

    it "does not route to #index" do
      expect(:get => 'photos').to_not be_routable
    end

    it "does not route to #show" do
      expect(:get => 'photos/1').to_not be_routable
    end
  end
end
