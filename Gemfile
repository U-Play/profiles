source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'capistrano'
gem 'capistrano-ext'
gem 'cancan'
gem 'rvm-capistrano'
gem 'devise'
gem 'dotenv-rails'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'jquery-rails'
gem 'mixpanel-ruby'
gem "nested_form"
gem 'slim'
gem 'settingslogic'
gem 'paperclip'
gem 'paranoia'
gem 'paranoia_uniqueness_validator'
gem 'roadie'
gem 'i18n_country_select'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'
  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation', '~> 4.0.0'
  gem 'therubyracer', :platforms => :ruby
end

group :development, :test do
  gem 'sqlite3'
end

group :development do
  gem 'guard'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'mail_view'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'capybara-webkit'
  gem 'database_cleaner', require: false
  gem 'factory_girl_rails'
  gem "launchy"
  gem 'simplecov', require: false
end

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :production do
  gem 'pg'
end

