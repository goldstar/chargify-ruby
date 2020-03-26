module Chargify
  module Resources
    class PaymentProfiles < Resource
      def find(id)
        response = client.get("payment_profiles/#{id}.json")
        Models::PaymentProfile.new(response.body["payment_profile"])
      end

      def list(options={})
        response = client.get("payment_profiles.json", options)
        Collection.new(Models::PaymentProfile, response.body)
      end
    end
  end
end
