module Chargify
  module Resources
    class Components < Resource
      def lookup(handle)
        response = client.get("components/lookup.json", handle: handle)
        Models::Component.new(response.body["component"])
      end
    end
  end
end
