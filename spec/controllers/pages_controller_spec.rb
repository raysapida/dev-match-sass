require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  context 'GET home' do
    render_views

    it 'gives a success response when going to home' do
      get :home
      expect(response.status).to eq(200)
    end

    it 'renders home template' do
      get :home
      expect(response.body).to match(/Home/im)
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
