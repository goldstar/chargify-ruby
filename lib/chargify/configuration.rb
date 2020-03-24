require "dry-configurable"

module Chargify
  module Configuration
    def self.extended(base)
      base.extend Dry::Configurable

      base.setting :api_key
      base.setting :proxy
      base.setting :subdomain
    end
  end
end
