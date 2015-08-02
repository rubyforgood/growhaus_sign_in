require 'rails_helper'
require 'auth_helper'

require 'pry'

RSpec.describe "Pages", type: :feature do
  describe "access root page" do

    it "can sign in user with Google account" do
      visit '/'
      expect(page).to have_content("Log In")
      mock_auth_hash
      click_link "Log In"
      expect(page).to have_content("Welcome")  # user name
      #page.should have_css('img', :src => 'mock_user_thumbnail_url') # user image
      #page.should have_content("Sign out")
    end

    it "can handle authentication error" do
      OmniAuth.config.mock_auth[:google] = :invalid_credentials
      visit '/'
      expect(page).to have_content("Log In")
      click_link "Log In"
      #expect(page).to have_content('Log In')
    end

  end
end
