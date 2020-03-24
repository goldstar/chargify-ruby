module Chargify
  module Resources
    class ProductFamilies < Resource
      def create(options={})
        response = client.post("product_families.json", options)
        Models::ProductFamily.new(response.body["product_family"])
      end

      def find(id)
        response = client.get("product_families/#{id}.json")
        Models::ProductFamily.new(response.body["product_family"])
      end
    end
  end
end
