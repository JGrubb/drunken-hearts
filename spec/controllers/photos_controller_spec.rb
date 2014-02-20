require 'spec_helper'

describe PhotosController do
  

  describe "GET edit" do

    context "Auth user" do
      login_user

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

  end

  describe "PUT update" do

  end

  describe "DELETE destroy" do

  end

end
