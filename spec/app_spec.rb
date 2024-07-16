# frozen_string_literal: true

require File.expand_path '../spec_helper.rb', __FILE__

describe 'My Sinatra Application' do
  it 'creates a new company' do
    post '/companies', { "name": "Test Company", "country": "Test Country" }.to_json, "CONTENT_TYPE" => "application/json"
    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)['name']).to eq('Test Company')
    expect(JSON.parse(last_response.body)['country']).to eq('Test Country')
  end

  it 'gets a list of all companies' do
    get '/companies'
    expect(last_response).to be_ok
  end

  it 'gets details about a company' do
    company = Company.create(name: "Test Company", country: "Test Country")
    get "/companies/#{company.id}"
    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)['name']).to eq("Test Company")
  end

  it 'updates a company' do
    company = Company.create(name: "Test Company", country: "Test Country")
    put "/companies/#{company.id}", { "name": "Updated Company", "country": "Updated Country" }.to_json, "CONTENT_TYPE" => "application/json"
    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)['name']).to eq('Updated Company')
    expect(JSON.parse(last_response.body)['country']).to eq('Updated Country')
  end

  it 'create a new owner'do
    company = Company.create(name: "Test Company", country: "Test Country")
    post "/companies/#{company.id}/owners", { "name": "Test Owner", "ssn": "Test SSN", "company_id": company.id}.to_json, "CONTENT_TYPE" => "application/json"
    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)['name']).to eq('Test Owner')
    expect(JSON.parse(last_response.body)['ssn']).to eq('Test SSN')
  end

  it 'Check SSN' do
    company = Company.create(name: "Test Company", country: "Test Country")
    owner = Owner.create(name: "Test Name", ssn: 'Test SSN', company_id: company.id)
    get "/owners/#{owner.id}/check_ssn"
    expect(last_response).to be_ok
  end
end
