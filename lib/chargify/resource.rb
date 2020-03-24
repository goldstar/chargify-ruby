module Chargify
  class Resource < Module
    attr_reader :client

    def self.inherited(subclass)
      Resources.registry << subclass
    end

    def initialize(client)
      @client = client
    end
  end
end
