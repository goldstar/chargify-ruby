module Chargify
  module Resources
    class Products < Resource
      def create(product_family_id, options={})
        response = client.post("product_families/#{product_family_id}/products.json", options)
        Models::Product.new(response.body["product"])
      end

      def find(id)
        response = client.get("products/#{id}.json")
        Models::Product.new(response.body["product"])
      end

      def list(product_family_id)
        response = client.get("product_families/#{product_family_id}/products.json")
        Collection.new(Models::Product, response.body)
      end

      def lookup(handle)
        response = client.get("products/handle/#{handle}.json")
        Models::Product.new(response.body["product"])
      end
    end
  end
end
