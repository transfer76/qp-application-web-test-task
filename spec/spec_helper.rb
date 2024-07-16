# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'test'

require File.expand_path '../../app.rb', __FILE__
require 'rspec'
require 'rack/test'
require 'database_cleaner/active_record'

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure do |config|
  config.include RSpecMixin

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  Kernel.srand(config.seed)
end
