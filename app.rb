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
require_relative 'lib/helpers/find_owner'
require_relative 'lib/helpers/check_ssn'

# API endpoints
before do
  content_type :json
end

before '/owners/:id/check_ssn' do
  halt 403, JSON({ error: 'Forbidden' }) unless request.env.fetch('USER_ROLE', 'admin') == 'admin'
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

# Create Owner and add owner to company
post '/companies/:id/owners' do
  data = JSON.parse(request.body.read)
  owner = Owner.create!(
            name: data['name'],
            ssn: data['ssn']
          )

  company = find_company(params['id'])
  company[:owner_ids].push(owner['id'])
  company.save
  owner.to_json
end

get '/owners/:id/check_ssn' do
  owner = find_owner(params['id'])
  JSON(ssn: owner[:ssn], validity: check_ssn)
end
