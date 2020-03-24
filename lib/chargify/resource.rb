module Chargify
  class Resource < Module
    attr_reader :client

    def self.inherited(subclass)
      registry << subclass
    end

    def self.registry
      @registry ||= Set.new
    end

    def initialize(client)
      @client = client
    end
  end
end
