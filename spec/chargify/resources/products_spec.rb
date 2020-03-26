require "spec_helper"

describe Chargify::Api::Products do
  subject(:products) { described_class }

  describe ".create", vcr: { cassette_name: "products/create" } do
    let(:product_family_id) { 1518096 }
    let(:params) {{
      product: {
        name: "Gold Plan",
        handle: "gold",
        description: "This is our gold plan.",
        accounting_code: "123",
        request_credit_card: true,
        price_in_cents: 1000,
        interval: 1,
        interval_unit: "month",
        auto_create_signup_page: true,
        tax_code: "D0000000"
      }
    }}

    it "creates a POST request for 'products/:family_id/products'" do
      expect(products.client).to receive(:post).
        with("product_families/#{product_family_id}/products.json", params).
        and_call_original

      products.create(product_family_id, params)
    end

    it "returns a Chargify::Models::Product" do
      expect(products.create(product_family_id, params)).
        to be_a Chargify::Models::Product
    end
  end

  describe ".find", vcr: { cassette_name: "products/find" } do
    let(:id) { 5216049 }

    it "creates a GET request for 'products/:id'" do
      expect(products.client).to receive(:get).
        with("products/#{id}.json").and_call_original

      products.find(id)
    end

    it "returns a Chargify::Models::Product" do
      expect(products.find(id)).
        to be_a Chargify::Models::Product
    end
  end

  describe ".list", vcr: { cassette_name: "products/list" } do
    let(:product_family_id) { 1518096 }

    it "creates a GET request for 'products'" do
      expect(products.client).to receive(:get).
        with("product_families/#{product_family_id}/products.json").
        and_call_original

      products.list(product_family_id)
    end

    it "returns a Chargify::Collection of Models::Product", :aggregate_failures do
      result = products.list(product_family_id)

      expect(result).to be_a Chargify::Collection
      expect(result).to all be_a Chargify::Models::Product
    end
  end

  describe ".lookup", vcr: { cassette_name: "products/lookup" } do
    let(:handle) { "gold" }

    it "creates a GET request for 'products/handle/:id'" do
      expect(products.client).to receive(:get).
        with("products/handle/#{handle}.json").
        and_call_original

      products.lookup(handle)
    end

    it "returns a Chargify::Models::Product" do
      expect(products.lookup(handle)).
        to be_a Chargify::Models::Product
    end
  end
end
