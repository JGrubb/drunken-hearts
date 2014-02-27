require 'spec_helper'

describe ProductsController do

  describe "GET show" do

    let(:product) do
      create(:product)
    end

    it "assigns the product to @product" do
      get :show, id: product
      expect(assigns(:product)).to eq product
    end

    it "renders the show template" do
      get :show, id: product
      expect(response).to render_template :show
    end

    it "assigns the page title to @title" do
      get :show, id: product
      expect(assigns(:title)).to eq "Awesome T Shirt"
    end
  end

  describe "GET new" do
    context "Authorized user" do
      login_admin

      before :each do
        get :new  
      end

      it "assigns a new product as @product" do
        expect(assigns(:product)).to be_a_new(Product)
      end

      it "renders the new template" do
        expect(response).to render_template :new
      end
    end

    context "Random Joe" do
      it "prevents Random Joe from getting to the new product page" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
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
