require 'rails_helper'
require 'auth_helper'

RSpec.describe "Pages", type: :request do
  describe "access root page" do

    it "can sign in user with Google account" do
      visit '/'
      page.should have_content("Log In")
      mock_auth_hash
      click_link "Log in"
      page.should have_content("mockuser")  # user name
      #page.should have_css('img', :src => 'mock_user_thumbnail_url') # user image
      #page.should have_content("Sign out")
    end

    it "can handle authentication error" do
      OmniAuth.config.mock_auth[:google] = :invalid_credentials
      visit '/'
      page.should have_content("Sign in with Twitter")
      click_link "Sign in"
      page.should have_content('Authentication failed.')
    end

  end
end
