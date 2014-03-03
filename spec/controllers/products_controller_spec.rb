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
    
    let(:product) { create :product }

    context "Authorized user" do
      login_admin

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
      it "prevents RJ from accessing the products#edit page" do
        get :edit, { :id => product.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "PATCH update" do
    let(:product) { create :product }

    context "Authorized user" do

    end

    context "Random Joe" do

    end
  end

  describe "DELETE destroy" do

    let!(:product) { create :product }

    context "Authorized user" do
      login_admin

      it "destroys the requested product" do
        expect {
          delete :destroy, { :id => product.id }
        }.to change(Product, :count).by -1
      end

      it "redirects to the store path" do
        delete :destroy, { :id => product.id }
        expect(response).to redirect_to store_path
      end
    end

    context "Random Joe" do
      before(:each) { delete :destroy, { :id => product.id } }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end
end
