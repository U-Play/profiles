source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'jquery-rails'
gem 'slim'
gem 'sqlite3'
gem 'rails_presenter'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation', '~> 4.0.0'
  gem 'therubyracer', :platforms => :ruby
end

group :development do
  gem 'guard'
  gem 'guard-cucumber'
  gem 'guard-rspec'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner', require: false
  gem 'factory_girl_rails'
  gem 'simplecov', require: false
end

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :production do
  gem 'pg'
end

