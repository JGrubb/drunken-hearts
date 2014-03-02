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
    context "Autorized user" do
      login_admin

      it "creates a new product" do
        expect {
          create :product
        }.to change(Product, :count).by 1
      end

      it "assigns a newly created product to @product" do
        post :create, { :product => attributes_for(:product) }
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end

      it "redirects to the product's page" do
        post :create, { :product => attributes_for(:product) }
        expect(response).to redirect_to product_path(Product.last)
      end
    end

    context "Random Joe" do
      it "prevents Random Joe from creating a new Product" do
        post :create, { :product => attributes_for(:product) }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "GET edit" do
    

    context "Authorized user" do
      login_admin
      let(:product) { create :product }

      it "assigns the requested product as @product" do
        get :edit, { :id => product.id }
        expect(assigns(:product)).to eq product
      end

      it "renders the edit template" do
        get :edit, { :id => product.id }
        expect(response).to render_template :edit
      end
    end

    context "Random Joe" do
      it "prevents RJ from accessing the products#edit page"
    end
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
