require 'spec_helper'

describe PhotosController do
  

  describe "GET edit" do

    context "Auth user" do
      login_admin

      before :each do
        @photo = create(:photo)
        get :edit, { :id => @photo.id }
      end

      it "assigns the requested photo to @photo" do
        expect(assigns(:photo)).to eq @photo
      end

      it "renders the edit form" do
        expect(response).to render_template :edit
      end
    end

    context "Anonymous jerk" do

      before :each do
        @photo = create(:photo)
        get :edit, { :id => @photo.id }
      end

      it "prevents this guy from getting to the edit form" do
        expect(assigns(:photo)).to be nil 
      end

      it "redirects this guy to the login form, since perhaps he's legit and just not logged in" do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "POST create" do
    context "Auth user" do
      login_admin

      describe "with valid parameters" do
        
        it "creates a new photo" do
          expect {
            create :photo
          }.to change(Photo, :count).by 1
        end

        it "assigns the new photo as @photo" do
          post :create, { :photo => attributes_for(:photo)}
          expect(assigns(:photo)).to be_a(Photo)
          expect(assigns(:photo)).to be_persisted
        end
      end
    end

    context "random, unauthorized shmuck" do
      it "prevents the shmuck from creating new photos" do
        post :create, { :photo => attributes_for(:photo) }
        expect(assigns(:photo)).to be nil
      end

      it "redirects the shmuck to the login page" do
        post :create, { :photo => attributes_for(:photo) }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "PUT update" do
    login_admin

    it "redirects to the photos_path" do
      photo = create :photo
      put :update, { :id => photo.id, :photo => attributes_for(:photo) }
      expect(response).to redirect_to photos_path
    end
  end

  describe "DELETE destroy" do
    login_admin

    before :each do
      @photo = create :photo
    end

    it "redirects to the photos_path" do
      delete :destroy, { :id => @photo.id }
      expect(response).to redirect_to photos_path
    end

    it "destroys the photo" do
      expect {
        delete :destroy, { :id => @photo.id }
      }.to change(Photo, :count).by -1
    end
  end

  describe "photos routing" do
    it "routes to #new" do
      expect(:get => 'photos/new').to route_to(:controller => "photos", :action => "new")
    end

    it "routes to #edit" do
      expect(:get => 'photos/1/edit').to route_to(:controller => "photos", :action => "edit", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => 'photos/1').to route_to(:controller => "photos", :action => "destroy", :id => "1")
    end

    it "routes to #update" do
      expect(:put => 'photos/1').to route_to(:controller => "photos", :action => "update", :id => "1")
    end

    it "routes to #create" do
      expect(:post => 'photos').to route_to(:controller => "photos", :action => "create")
    end

    it "does not route to #index" do
      expect(:get => 'photos').to_not route_to(:controller => "photos", :action => "index")
    end

    it "does not route to #show" do
      expect(:get => 'photos/1').to_not route_to(:controller => "photos", :action => "show", :id => "1")
    end
  end
end
