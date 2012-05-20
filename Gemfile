source 'http://rubygems.org'
source 'http://gems.github.com'

gem 'rails', '3.2.2'

#
# Misc
#
gem 'json_builder' # JSON builder

#
# Models/database
#
gem 'pg' # PostgreSQL database
gem "paperclip", "~> 3.0.0" # Photo and file attachments
gem 'will_paginate' # Paging support for ActiveRecord models
#gem 'georuby'

#
# Service integration
#
gem 'omniauth'
gem 'rest-client'

#
# Javascript libraries
#
gem 'jquery-rails' # jQuery support (replaces Prototype)

#
# Production-specific gems
#
group :production do
  gem 'unicorn' if RUBY_PLATFORM.downcase.include?("linux")
  #gem 'capistrano' # Deployment
end

#
# Test-specific gems
#
group :test do
  gem 'minitest'
  gem 'turn', :require => false # Pretty print test output
end

#
# Gems used only for assets and not required
# in production environments by default.
#
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer' if RUBY_PLATFORM.downcase.include?("linux") # https://github.com/sstephenson/execjs#readme
  gem 'uglifier', '>= 1.0.3' # Replaces default closure-compiler
end
