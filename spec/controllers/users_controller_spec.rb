require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  context 'GET show' do
    it 'redirects to sign in with unauthenicated user' do
      get :show, { id: user.id }

      expect(response).to redirect_to(new_user_session_path)
    end

    it "assigns the requested user as @user when authenticated" do
      sign_in :user, user

      get :show, { id: user.id }

      expect(assigns(:user)).to eq(user)
    end

    it 'renders show template with authenticated user' do
      sign_in :user, user

      get :show, { id: user.id }

      expect(response).to render_template(:show)
    end
  end

  context 'GET index' do
    it 'redirects to sign in with unauthenicated user' do
      get :index

      expect(response).to redirect_to(new_user_session_path)
    end

    it 'assigns all statuses as @statuses' do
      sign_in :user, user

      get :index, {}

      expect(assigns(:users)).to eq([user])
    end

    it 'renders index template' do
      sign_in :user, user

      get :index, {}

      expect(response).to render_template(:index)
    end
  end
end
