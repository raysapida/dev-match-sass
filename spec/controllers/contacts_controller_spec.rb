require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  context 'GET new' do
    subject { get :new }

    it 'render new view' do
      expect(subject).to render_template(:new)
    end
  end

  context 'POST create' do
  end
end
