
# This came from https://gist.github.com/kinopyo/1338738 
#
module OmniauthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
      'provider' => 'google',
      'uid' => '123545',
      'user_info' => {
        'name' => 'mockuser',
        'image' => 'mock_user_thumbnail_url'
      },
      'credentials' => {
        'token' => 'mock_token',
        'secret' => 'mock_secret'
      }
    })
  end
end

# include this to mock out Omniauth authentication
RSpec.configure do |config|
  config.include(OmniauthMacros)
end

OmniAuth.config.test_mode = true

