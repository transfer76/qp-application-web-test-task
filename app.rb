# frozen_string_literal: true

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'json'
require 'securerandom'
require_relative 'lib/company'
require_relative 'lib/owner'
require_relative 'lib/helpers/find_company'

# Include helpers methods
include Helpers

# API endpoints
before do
  content_type :json
end

# Get list of companies
get '/companies' do
  {
    data: {
      companies: Company.all
    }
  }.to_json
end

# Create a new company
post '/companies' do
  data = JSON.parse(request.body.read)
  Company.create!(
    name: data['name'],
    country: data['country'],
    phone: data['phone']
  )
end

# Get details about company by :id
get '/companies/:id' do
  find_company(params['id']).to_json
end

# Update the company
put '/companies/:id' do
  data = JSON.parse(request.body.read)
  company = find_company(params['id'])
  company[:name] = data['name'] if data['name']
  company[:country] = data['country'] if data['country']
  company[:phone] = data['phone'] if data['phone']
  company.to_json
end
