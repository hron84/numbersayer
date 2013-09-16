source "https://rubygems.org"

gem 'rails', '~> 3.2.14'

group :assets do
  gem 'coffee-rails'
  gem 'sass-rails'
  gem 'jquery-rails'
  gem 'uglifier'
end

# Webserver
gem 'thin'

group :development do
  gem 'pry-rails'

  gem 'better_errors', :platform => :ruby_19
  gem 'binding_of_caller', :platform => :ruby_19

  # Guard
  gem 'rb-inotify', :require => false if RUBY_PLATFORM.match(/linux/i)
  gem 'guard'

  # Guard plug-ins
  gem 'guard-bundler', :require => false
  gem 'guard-rspec', :require => false
  gem 'guard-cucumber', :require => false
  gem 'guard-resque', :require => false
  gem 'guard-rack', :require => false
end

group :production do
  gem 'rack-protection'
end

group :test do
  gem 'cucumber-rails', :require => false

  gem 'simplecov', :require => false
end


gem 'rspec-rails', :group => [:development, :test]

# Theming
gem 'haml-rails'
gem 'twitter-bootstrap-rails'

gem 'exception_notification'
