# frozen_string_literal: true

class Company < ActiveRecord::Base
 attr_accessor :name, :country, :phone, :owner_id
end
