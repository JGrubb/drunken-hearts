require 'spec_helper'
require 'sidekiq/testing'

describe SongsController do

  describe "GET new" do
    context "Authorized user" do
      login_admin
      it "assigns a new song to @song" do
        song = Song.new
        get :new
        expect(assigns(:song)).to be_a_new(Song)
      end

      it "renders the new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    context "Random joe" do
      it "redirects Random Joe to the login page" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "POST create" do
    context "Authorized user" do
      login_admin

      it "creates a new song" do
        expect {
          post :create, { song: attributes_for(:song) }
        }.to change(Song, :count).by 1
      end

      it "assigns a newly created song as @song" do
        post :create, { song: attributes_for(:song) }
        expect(assigns(:song)).to be_a(Song)
        expect(assigns(:song)).to be_persisted
      end

      it "redirects to the music path" do
        post :create, { song: attributes_for(:song) }
        expect(response).to redirect_to music_path
      end

      it "pushes a job to the Sidekiq cue" do
        song = create :song
        expect {
          ConversionWorker.perform_async(song.id)
        }.to change(ConversionWorker.jobs, :size).by 1
      end

      it "sets the name if none is present" do
        song = create :song, title: nil
        expect(song.title).to eq "Artpop"
      end

      it "doesn't set the name if one is present" do
        song = create :song
        expect(song.title).to eq "Art Pop"
      end
    end

    context "Random Joe" do
      it "prevents Random Joe from creating new songs" do
        expect {
          post :create, { song: attributes_for(:song) }
        }.to change(Song, :count).by 0
      end

      it "redirects Joe to the login page" do
        post :create, { song: attributes_for(:song) }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "GET edit" do
    context "Authorized user" do
      login_admin

      before :each do
        @song = create :song
        get :edit, { id: @song.id }
      end

      it "assigns the song to @song" do
        expect(assigns(:song)).to eq(@song)
      end

      it "renders the edit template" do
        expect(response).to render_template :edit
      end
    end

    context "Random Joe" do
      it "redirects Joe to the login path" do
        get :edit, { id: 1 }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "PUT update" do
    context "Authorized user" do
      login_admin

      before :each do
        @song = create :song
      end

      it "updates the requested song" do
        expect_any_instance_of(Song).to receive(:update)
        put :update, { id: @song.id, song: { title: "Ascending" } }
      end

      it "redirects_to music_path" do
        put :update, { id: @song.id, song: attributes_for(:song) }
        expect(response).to redirect_to music_path
      end
    end

    context "Random Joe" do
      it "redirects Joe to the login path" do
        put :update, { id: 1, song: attributes_for(:song) }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "DELETE destroy" do
    context "Authorized user" do
      login_admin

      before :each do
        @song = create :song
      end

      it "deletes the requested song" do
        expect {
          delete :destroy, { id: @song.id }
        }.to change(Song, :count).by -1
      end

      it "redirects to the music_path" do
        delete :destroy, { id: @song.id }
        expect(response).to redirect_to music_path
      end
    end

    context "Random Joe" do
      it "tells joe to login" do
        delete :destroy, { id: 1 }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

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
      expect(:get => 'songs').to_not be_routable
    end

    it "does not route to #show" do
      expect(:get => 'songs/1').to_not be_routable
    end
  end
end
