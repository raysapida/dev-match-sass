require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let!(:basic) { Plan.create(name: 'basic', price: 0, id: 1) }
  let!(:pro) { Plan.create(name: 'pro', price: 10, id: 2) }

  context 'GET home' do
    render_views

    it 'gives a success response when going to home' do
      get :home
      expect(response.status).to eq(200)
    end

    it 'renders home template' do
      get :home
      expect(response.body).to match(/Welcome/im)
    end
  end

  context 'GET about' do
    render_views

    it 'gives a success response when going to home' do
      get :about
      expect(response.status).to eq(200)
    end

    it 'renders home template' do
      get :about
      expect(response.body).to match(/About/im)
    end
  end
end
