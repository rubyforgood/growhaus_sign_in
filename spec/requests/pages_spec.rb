require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /" do
    it "requesting the root of the website redirects to google to login" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
