require 'rails_helper'

RSpec.describe PagesController, type: :controller do
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
