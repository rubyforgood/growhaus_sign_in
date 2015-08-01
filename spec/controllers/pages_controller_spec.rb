require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET login' do
    render_views

    it 'renders the login form' do
      get :login
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template('login')
      expect(response.body).to have_title('GrowhausSignIn')
    end
  end
end
