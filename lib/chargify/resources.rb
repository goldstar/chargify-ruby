module Chargify
  module Resources
    def self.registry
      @register ||= Set.new
    end

    require_relative "resources/customers"
  end
end
