require 'spec_helper'

describe StoreController do

  describe "GET 'index'" do
    
    let(:product) { create :product }
    before(:each) { get :index }

    it "assigns all published products to @products" do
      expect(assigns(:products)).to eq([product])
    end 

    it "renders the store index template" do
      expect(response).to render_template :index
    end
  end

  describe "store routes" do
    it "routes to index" do
      expect(:get => 'store').to route_to(:controller => 'store', :action => 'index')
    end
  end
end
