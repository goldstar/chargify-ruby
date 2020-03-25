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

      def lookup(reference)
        response = client.get("subscriptions/lookup.json", reference: reference)
        Models::Subscription.new(response.body["subscription"])
      end
    end
  end
end
