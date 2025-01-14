# frozen_string_literal: true

source 'http://rubygems.org'

# Build a persistent domain model by mapping database tables to Ruby classes
gem 'activerecord', '~> 7.1'
gem 'json', '~> 2.7'
gem 'rack', '~> 3.1'
gem 'rackup', '~> 2.1'
gem 'rake', '~> 13.2'
gem 'sinatra', '~> 4.0'
# Extends Sinatra with ActiveRecords helpers
gem 'sinatra-activerecord', '~> 2.0'
# Collection of useful Sinatra extensions
gem 'sinatra-contrib', '~> 4.0'

group :development, :test do
  gem 'database_cleaner-active_record', '~> 2.0'
  # database
  gem 'pg', '~> 1.5'
  # Debug console
  gem 'pry', '~> 0.14.2'
  # Integration testings
  gem 'rack-test', '~> 2.1'
  # Rspec unit tests
  gem 'rspec', '~> 3.13.0'
  # Rubocop linter
  gem 'rubocop', '~> 1.65', require: false
  # A collection of RubocopCops to check for performance optimizations in Ruby
  # code
  gem 'rubocop-performance', '~> 1.21', require: false
  # Tux dresses up sinatra in a shell
  gem 'tux', ' ~> 0.3.0'
end
