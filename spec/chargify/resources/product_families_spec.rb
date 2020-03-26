require "spec_helper"

describe Chargify::Api::ProductFamilies do
  subject(:product_families) { described_class }

  describe ".create", vcr: { cassette_name: "product_families/create" } do
    let(:params) {{
      product_family: {
        name: "Acme Projects",
        description: "Amazing project management tool"
      }
    }}

    it "creates a POST request for 'product_families'" do
      expect(product_families.client).to receive(:post).
        with("product_families.json", params).and_call_original

      product_families.create(params)
    end

    it "returns a Chargify::Models::Product" do
      expect(product_families.create(params)).
        to be_a Chargify::Models::ProductFamily
    end
  end

  describe ".find", vcr: { cassette_name: "product_families/find" } do
    let(:id) { 1518096 }

    it "creates a GET request for 'product_families/:id'" do
      expect(product_families.client).to receive(:get).
        with("product_families/#{id}.json").and_call_original

      product_families.find(id)
    end

    it "returns a Chargify::Models::Product" do
      expect(product_families.find(id)).
        to be_a Chargify::Models::ProductFamily
    end
  end

  describe ".list", vcr: { cassette_name: "product_families/list" } do
    it "creates a GET request for 'product_families'" do
      expect(product_families.client).to receive(:get).
        with("product_families.json").and_call_original

      product_families.list
    end

    it "returns a Chargify::Collection of Models::ProductFamily", :aggregate_failures do
      result = product_families.list

      expect(result).to be_a Chargify::Collection
      expect(result).to all be_a Chargify::Models::ProductFamily
    end
  end
end
