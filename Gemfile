source 'https://rubygems.org'

gem 'rails', '4.2.3'
#gem 'pg', group: :production
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'unicorn'

group :production do
  gem 'pg'
end

gem 'bootstrap-sass'
gem 'slim', '~> 3.0.6'
gem 'jquery-datatables-rails', '~>3.3.0'
gem "omniauth-google-oauth2"
gem "figaro"

group :development, :test do
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  # Don't gitblame me later. Not my decision!
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
  gem 'pry-rails'
  gem 'better_errors'
  gem 'guard'
  gem 'guard-rubocop'
  gem 'guard-rspec'
  gem 'rubocop'
  gem 'bundler-audit'
  gem 'i18n-spec'
  gem 'capistrano',  '~> 3.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler', '~> 1.1'
  gem 'capistrano-rvm'
end

# gem 'capistrano-rails', group: :development

