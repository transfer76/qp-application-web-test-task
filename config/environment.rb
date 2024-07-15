# frozen_string_literal: true

# specifies wich env to run
ENV['RACK_ENV'] || 'development'

# Require Gems before running code
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

require_all 'app'
