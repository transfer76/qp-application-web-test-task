# frozen_string_literal: true

# Class allows database access to Company table
class Company < ActiveRecord::Base
  has_many :owners
end
