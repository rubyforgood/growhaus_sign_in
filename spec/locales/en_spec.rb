require 'rails_helper'
require 'i18n-spec'

describe "en locale file" do
  it_behaves_like 'a valid locale file', 'config/locales/en.yml'
end
