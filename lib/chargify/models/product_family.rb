module Chargify
  module Models
    class ProductFamily < Model
      attribute :id
      attribute :name
      attribute :description
      attribute :handle
      attribute :accounting_code
    end
  end
end
