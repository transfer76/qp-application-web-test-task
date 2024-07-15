# frozen_string_literal: true

# Class allows database access to Company table
class Company < ActiveRecord::Base
  attr_accessor :name, :country, :phone, :owner_id

  many_to_one :owner
end
