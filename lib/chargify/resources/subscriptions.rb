module Chargify
  module Resources
    class Subscriptions < Resource
      def create(options={})
        response = client.post("subscriptions.json", options)
        Models::Subscription.new(response.body["subscription"])
      end

      def find(id)
        response = client.get("subscriptions/#{id}.json")
        Models::Subscription.new(response.body["subscription"])
      end

      def list(options={})
        response = client.get("subscriptions.json", options)
        Collection.new(Models::Subscription, response.body)
      end

      def lookup(reference)
        response = client.get("subscriptions/lookup.json", reference: reference)
        Models::Subscription.new(response.body["subscription"])
      end
    end
  end
end
