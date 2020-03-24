module Chargify
  module Resources
    class Customers < Resource
      def create(options={})
        response = client.post("customers.json", options)
        Models::Customer.new(response.body["customer"])
      end
    end
  end
end
