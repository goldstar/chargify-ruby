module Chargify
  class Site < Module
    attr_reader :name

    def initialize(name)
      @name = name

      extend Configuration

      Resource.registry.each do |resource|
        const_set resource.name.demodulize, resource.new(client)
      end
    end

    def client
      @client ||= Client.new(self)
    end
  end
end
