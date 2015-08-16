require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:user) { create(:user) }

  let(:valid_attributes) {
    { first_name: 'First',
      last_name: 'Last',
      job_title: 'Developer',
      user_id: user.id,
      phone_number: '123 456 7890',
      contact_email: 'something@test.com' }
  }

  let(:invalid_attributes) {
    {contact_email: '' }
  }

  let(:valid_session) { {} }

  describe "GET #show" do
    it "assigns the requested profile as @profile" do
      sign_in :user, user
      profile = Profile.create! valid_attributes
      get :show, {user_id: user.id}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #new" do
    it "assigns a new profile as @profile" do
      sign_in :user, user
      get :new, { user_id: user}, valid_session
      expect(assigns(:profile)).to be_a_new(Profile)
    end
  end

  describe "GET #edit" do
    it "assigns the requested profile as @profile" do
      sign_in :user, user
      profile = Profile.create! valid_attributes
      get :edit, {user_id: user.id}, valid_session
      expect(assigns(:profile)).to eq(profile)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Profile" do
        expect {
          sign_in :user, user
          post :create, {profile: valid_attributes, user_id: user.id}, valid_session
        }.to change(Profile, :count).by(1)
      end

      it "assigns a newly created profile as @profile" do
        sign_in :user, user
        post :create, {profile: valid_attributes, user_id: user.id}, valid_session
        expect(assigns(:profile)).to be_a(Profile)
        expect(assigns(:profile)).to be_persisted
      end

      it "redirects to the created profile" do
        sign_in :user, user
        post :create, {profile: valid_attributes, user_id: user.id}, valid_session
        expect(response).to redirect_to(user_path(user))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved profile as @profile" do
        sign_in :user, user
        post :create, {profile: invalid_attributes, user_id: user.id}, valid_session
        expect(assigns(:profile)).to be_a_new(Profile)
      end

      it "re-renders the 'new' template" do
        sign_in :user, user
        post :create, {profile: invalid_attributes, user_id: user.id}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { first_name: 'Second' }
      }

      it "updates the requested profile" do
        sign_in :user, user
        profile = Profile.create! valid_attributes
        put :update, {profile: new_attributes, user_id: user.id}, valid_session
        profile.reload
        expect(profile.first_name).to eq('Second')
      end

      it "assigns the requested profile as @profile" do
        sign_in :user, user
        profile = Profile.create! valid_attributes
        put :update, {profile: valid_attributes, user_id: user.id}, valid_session
        expect(assigns(:profile)).to eq(profile)
      end

      it "redirects to the profile" do
        sign_in :user, user
        profile = Profile.create! valid_attributes
        put :update, {profile: valid_attributes, user_id: user.id}, valid_session
        expect(response).to redirect_to(user_path(user))
      end
    end

    context "with invalid params" do
      it "assigns the profile as @profile" do
        sign_in :user, user
        profile = Profile.create! valid_attributes
        put :update, {profile: invalid_attributes, user_id: user.id}, valid_session
        expect(assigns(:profile)).to eq(profile)
      end

      it "re-renders the 'edit' template" do
        sign_in :user, user
        profile = Profile.create! valid_attributes
        put :update, {profile: invalid_attributes, user_id: user.id}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

end
