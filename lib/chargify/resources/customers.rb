module Chargify
  module Resources
    class Customers < Resource
      def create(options={})
        response = client.post("customers.json", options)
        Models::Customer.new(response.body["customer"])
      end

      def find(id)
        response = client.get("customers/#{id}.json")
        Models::Customer.new(response.body["customer"])
      end

      def list(options={})
        response = client.get("customers.json", options)
        Collection.new(Models::Customer, response.body)
      end

      def lookup(reference)
        response = client.get("customers/lookup.json", reference: reference)
        Models::Customer.new(response.body["customer"])
      end
    end
  end
end
