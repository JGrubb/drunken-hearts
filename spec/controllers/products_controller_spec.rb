require 'spec_helper'

describe ProductsController do

  describe "GET show" do
    it "assigns the product to @product"
    it "renders the show template"
    it "assigns the page title to @title"
  end

  describe "GET new" do
    context "Authorized user" do

    end

    context "Random Joe" do

    end
  end

  describe "POST create" do

  end

  describe "GET edit" do

  end

  describe "PATCH update" do

  end

  describe "DELETE destroy" do

  end

  describe "routing" do
    it "routes to #show" do
      expect(:get => 'products/1').to route_to(:controller => "products", :action => "show", :id => "1")
    end
    
    it "routes to #new" do
      expect(:get => 'products/new').to route_to(:controller => "products", :action => "new")
    end

    it "routes to #edit" do
      expect(:get => 'products/1/edit').to route_to(:controller => "products", :action => "edit", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => 'products/1').to route_to(:controller => "products", :action => "destroy", :id => "1")
    end

    it "routes to #update" do
      expect(:put => 'products/1').to route_to(:controller => "products", :action => "update", :id => "1")
    end

    it "routes to #create" do
      expect(:post => 'products').to route_to(:controller => "products", :action => "create")
    end

    it "does not route to #index" do
      expect(:get => 'products').to_not be_routable
    end
  end
end
