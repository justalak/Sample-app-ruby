source "http://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.2", ">= 6.0.2.1"
# Use sqlite3 as the database for Active Record
gem "mysql2"
gem "bootstrap", "~> 4.4", ">= 4.4.1"
gem "jquery-rails"
# Use Puma as the app server
gem "puma", "~> 4.1"
gem "bcrypt", "~> 3.1", ">= 3.1.13"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
gem "faker", "~> 2.10", ">= 2.10.1"
gem "kaminari", "~> 1.2"
gem "bootstrap4-kaminari-views", "~> 1.0", ">= 1.0.1"
gem "will_paginate", "~> 3.2", ">= 3.2.1"
gem "bootstrap-will_paginate"
gem "carrierwave", "~> 2.1"
gem "mini_magick", "~> 4.10", ">= 4.10.1"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 3.9"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"
end
# group :production do
#   gem "pg"
#   gem "fog"
# end
group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
end
# group :production do
#   gem "pg", "0.20.0"
#   gem "fog", "1.42"
# end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
