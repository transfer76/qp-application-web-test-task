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
  }.to_json(include: :owners)
end

# Create a new company
post '/companies' do
  data = JSON.parse(request.body.read)
  company = Company.create!(
    name: data['name'],
    country: data['country'],
    phone: data['phone']
  )

  company.to_json
end

# Get details about company by :id
get '/companies/:id' do
  company = find_company(params['id'])
  halt 404, { message: 'Company not found' }.to_json unless company

  company.to_json
end

# Update the company
put '/companies/:id' do
  data = JSON.parse(request.body.read)
  company = find_company(params['id'])
  halt 404, { message: 'Company not found' }.to_json unless company
  company.update(
    name: data['name'],
    country: data['country'],
    phone: data['phone']
  )

  company.to_json
end

# Create Owner and add owner to company
post '/companies/:id/owners' do
  data = JSON.parse(request.body.read)
  owner = Owner.create!(
    name: data['name'],
    ssn: data['ssn'],
    company_id: params['id']
  )

  halt 404, { message: 'Company not found' }.to_json unless owner.company
  owner.company[:owner_ids].push(owner['id'])
  owner.company.save

  owner.to_json
end

# Check Sosial Security Number
get '/owners/:id/check_ssn' do
  owner = find_owner(params['id'])
  halt 404, json({ error: 'Owner not found' }) unless owner
  JSON(ssn: owner[:ssn], validity: check_ssn)
end
