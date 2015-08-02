require 'rails_helper'
require 'auth_helper'

require 'pry'

RSpec.describe "Pages", type: :feature do
  describe "login page" do

    it "can sign in user with Google account" do
      visit '/'
      expect(page).to have_selector("input[type=submit][value='Log In']")
      mock_auth_hash
      click_button 'Log In'
      expect(page).to have_content('mockuser')
      #page.should have_css('img', :src => 'mock_user_thumbnail_url') # user image
      #page.should have_content("Sign out")
    end

    it "can handle authentication error" do
      OmniAuth.config.mock_auth[:google] = :invalid_credentials
      visit '/'
      expect(page).to have_selector("input[type=submit][value='Log In']")
      click_button 'Log In'
      #expect(page).to have_content('Log In')
    end

  end
end
