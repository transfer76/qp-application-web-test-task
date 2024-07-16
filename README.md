# `qp-application-web-service-viefsz` - Application Code Assignment

Sinatra Web App for managing Companies and their Owners

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
  - [Configuring](#configuring)
- [Local Testing](local-testing)

## Features

- Ability to run aaplication as Rackup app
- Ability to create new Companies
- Ability to create Owners and add them to Companies

## Requirements

Ruby MRI 3.1.0

## Instalation

- Clone repo to your local machine
- Get your terminal window to app directory
```
cd ./path/qp-application-web-service-viefsz
```
- Set ruby version to 3.1.0
- Bundle
```
Bundle install
```
- Set DB migrations
```
rake db:create
rake db:migrate
```

## Usage

- Run applicaation, in terminal:
```
ruby app.rb
```
- Open one more terminal to make requests
  
  We have such endpoints:
  - post '/companies'
  - get '/companies'
  - get '/companies/:id'
  - put '/companies/:id'
  - post '/companies/:id/owners'
  - get '/owners/:id/check_ssn'

  To make request do:
  
  - To get Companiies list
  ```
  curl localhost:4567/companies
  ```

  - To create company
  ```
  curl -X POST localhost:4567/companies -H "Content-Type: application/json" -d '{"name": "Jappware", "country": "Ukraine"}'
  ```

  - To get details about the company(set your :id)
  ```
  curl localhost:4567/companies/"6ca0b356-0809-48be-89f0-c49fb31828f4"
  ```

  - To put company
  ```
  curl -X PUT localhost:4567/companies/"6ca0b356-0809-48be-89f0-c49fb31828f4" -H "Content-Type: application/json" -d '{"name": "Lviv", "country": "Ukrain", "owner_id": "SecureRandom2"}'
  ```

  - To create Owner and Add owner id to company
  ```
  curl -X POST localhost:4567/companies/"6ca0b356-0809-48be-89f0-c49fb31828f4"/owners -H "Content-Type: application/json" -d '{"name": "Vitya", "ssn": "ssn7"}'
  ```

## Configuring

- Start Docker
```
docker build -t qp-application-web-service-viefsz .
docker run -p 4567:4567 qp-application-web-service-viefsz
```

## Local Testing

Run in terminal
```
bundle exec rspec
```

Note: if you will encounter DB errors, please try:
```
RACK_ENV=test rake db:drop db:create db:migrate
```
