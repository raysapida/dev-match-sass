require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  describe "GET /profiles" do
    it "works! (now write some real specs)" do
      pending('Figure out how request specs work - what set up they need')
      user = create(:user)
      get user_path(user)
      expect(response).to have_http_status(200)
    end
  end
end
