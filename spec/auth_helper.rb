
# This came from https://gist.github.com/kinopyo/1338738 
#
module OmniAuthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    #OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
    OmniAuth.config.add_mock(:google, {
      'provider' => 'Google',
      'uid' => '123545',
      'info' => {
        'name' => 'mockuser',
        'email' => 'mockuser@growhaus.org',
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
  config.include(OmniAuthMacros)
end

OmniAuth.config.test_mode = true

