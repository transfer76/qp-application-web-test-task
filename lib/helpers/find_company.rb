# frozen_string_literal: true

# Module Helpers include helpers methods 
module Helpers
  def find_company(id)
    Company.find(id)
  end
end
