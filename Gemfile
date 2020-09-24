source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Base
###
gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
gem 'redis', '~> 4.0'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'

gem 'jsonapi_parameters'
gem 'jsonapi-serializer', '~> 2.1'
gem 'webpacker', '~> 5.0'
gem 'webpacker-react'

# gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'rack-timeout', '~> 0.6'
gem 'sidekiq', '~> 6.1'

# Data
###
gem 'acts_as_paranoid'
gem 'auto_strip_attributes'
gem 'data_migrate'
# gem 'google-cloud-storage', '~> 1.2', require: false

# Convenience
###
gem 'awesome_print'
gem 'pry'
gem 'pry-rails'
gem 'to_bool'

# Security
###
gem 'audited'
# gem 'auth0'
# gem 'cancancan'
# gem 'devise'
# gem 'omniauth'
# gem 'omniauth-auth0'
# gem 'omniauth-rails_csrf_protection', '~> 0.1'
# gem 'rolify'

group :test do
  gem 'capybara'
  gem 'cuprite'
  gem 'selenium-webdriver'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'rspec-rails'
end

group :development do
  gem 'annotate'
  gem 'dip'
  gem 'listen'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end
