require "active_support/inflector"
require "dry-container"

module Chargify
  require_relative "chargify/client"
  require_relative "chargify/collection"
  require_relative "chargify/configuration"
  require_relative "chargify/model"
  require_relative "chargify/models"
  require_relative "chargify/resource"
  require_relative "chargify/resources"
  require_relative "chargify/response"
  require_relative "chargify/site"
  require_relative "chargify/version"

  Sites = Dry::Container.new

  def self.[](name)
    Sites.resolve(name)
  rescue Dry::Container::Error
    register(name)
    retry
  end

  def self.register(name)
    Sites.register(name, memoize: true) do
      Site.new(name).tap do |site|
        klass = ActiveSupport::Inflector.camelize(name)

        unless Chargify.const_defined?(klass)
          Chargify.const_set(klass, site)
        end
      end
    end
  end
end
