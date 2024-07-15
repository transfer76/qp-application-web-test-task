# frozen_string_literal: true

# Class allows database access to Owner table
class Owner < ActiveRecord::Base
  attr_accessor :name, :ssn

  one_to_many :companies
end
