require 'rails_helper'
require 'i18n-spec'

describe "config/locales/es.yml" do
  it_behaves_like 'a valid locale file', 'config/locales/es.yml'
  xit { is_expected.to be_a_complete_translation_of 'config/locales/en.yml' }
end
