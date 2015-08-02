
# This came from https://gist.github.com/kinopyo/1338738 
#
module OmniAuthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    #OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
    OmniAuth.config.add_mock(:google_oauth2, {
      'provider' => 'google_oauth2',
      'uid' => '123545',
      'info' => {
        'name' => 'mockuser',
        'email' => 'mockuser@growhaus.org',
        'image' => 'mock_user_thumbnail_url',
        'urls' => {'Google': 'https://plus.google.com'}
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

#{
#       "provider" => "google_oauth2",
#            "uid" => "",
#           "info" => {
#              "name" => "Robert Winter",
#             "email" => "",
#        "first_name" => "Robert",
#         "last_name" => "Winter",
#             "image" => "https://lh3.googleusercontent.com/photo.jpg?sz=50",
#              "urls" => {
#            "Google" => "https://plus.google.com/1"
#        }
#    },
#    "credentials" => {
#             "token" => "xxx",
#        "expires_at" => 1438462534,
#           "expires" => true
#    },
#          "extra" => {
#        "id_token" => "xxxx",
#        "raw_info" => {
#                      "kind" => "plus#personOpenIdConnect",
#                    "gender" => "male",
#                       "sub" => "1",
#                      "name" => "Robert Winter",
#                "given_name" => "Robert",
#               "family_name" => "Winter",
#                   "profile" => "https://plus.google.com/1",
#                   "picture" => "https://lh3.googleusercontent.com/photo.jpg?sz=50",
#                     "email" => "",
#            "email_verified" => "true",
#                    "locale" => "en"
#        }
#    }
#}
#
