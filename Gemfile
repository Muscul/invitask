source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do 
  gem "sqlite3", :platforms => [:mri, :mingw]
  gem "activerecord-jdbcsqlite3-adapter", :platforms => :jruby
end
group :production do 
  gem "pg", ">= 0.11.0", :platforms => [:mri, :mingw]
  gem "activerecord-jdbcpostgresql-adapter", :platforms => :jruby
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem 'devise'
gem 'validates_formatting_of'
gem 'phony_rails'
gem 'configatron'

group :development, :test do
  gem 'rspec-rails'
  gem 'rspec'
  gem 'email_spec'
  gem "factory_girl_rails"
  gem "capybara"
  gem "nifty-generators"
end