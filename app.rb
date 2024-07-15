# frozen_string_literal: true

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'json'
require 'securerandom'

# API endpoints
before do
  content_type :json
end

# class App < Sinatra::Base
get '/' do
  @companies = Company.all
end
