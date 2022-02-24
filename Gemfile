source 'https://rubygems.org'  ##

git_source(:github) do |repo_name|
   repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.7.2'

gem 'bcrypt'  ##added
gem 'rails', '5.2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'bootsnap'
gem 'jbuilder', '~> 2.5'
gem 'faraday'
gem 'json'
gem 'active-designer'
gem 'factory_bot_rails'
gem 'faker'
gem 'bootstrap', "~> 4.0.0"
gem "bootstrap_form", "~> 4.0"
gem 'jquery-rails'
gem 'figaro'

group :development, :test do
  gem 'pry'
  gem 'travis'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop-rails'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'simplecov'
  gem 'shoulda-matchers'
  gem 'orderly'
  gem 'webmock'
  gem 'vcr'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
