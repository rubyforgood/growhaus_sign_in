require 'rails_helper'

RSpec.describe "Staffs", type: :request do
  describe "GET /staffs" do
    it "works! (now write some real specs)" do
      get staffs_path
      expect(response).to have_http_status(302)
    end
  end
end
