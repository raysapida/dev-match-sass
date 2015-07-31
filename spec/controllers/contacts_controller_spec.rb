require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:valid_attributes) {
    {name: 'Name',
     email: 'sample@email.com',
     comments: 'Comment'}
  }

  context 'GET new' do
    subject { get :new }

    it 'render new view' do
      expect(subject).to render_template(:new)
    end
  end

  context 'POST create' do
    it 'increases POST count' do
      expect {
        post :create, { :contact => valid_attributes }
      }.to change(Contact, :count).by(1)
    end

    it 'redirects to root path' do
      post :create, { :contact => valid_attributes }
      expect(response).to redirect_to root_path
    end
  end
end
