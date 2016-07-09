source 'https://rubygems.org'

ruby '2.3.1'
gem 'rails', '4.2.3'

gem "figaro"
gem "omniauth-google-oauth2"
gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.1.0'
gem 'jbuilder', '~> 2.0'
gem 'jquery-datatables-rails', '~>3.3.0'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'slim', '~> 3.0.6'
gem 'therubyracer', platforms: :ruby
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'unicorn'

group :development, :test do
  gem 'awesome_print'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'poltergeist'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'

  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Don't gitblame me later. Not my decision!
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :development do
  gem 'better_errors'
  gem 'bundler-audit'
  gem 'capistrano',  '~> 3.1'
  gem 'capistrano-bundler', '~> 1.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rvm'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'i18n-spec'
  gem 'rubocop'
end

group :production do
  gem 'pg'
end
