# frozen_string_literal: true

# Class allows database access to Owner table
class Owner < ActiveRecord::Base
  belongs_to :company
end
