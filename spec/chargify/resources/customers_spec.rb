require "spec_helper"

describe Chargify::Api::Customers do
  subject(:customers) { described_class }

  describe ".create", vcr: { cassette_name: "customers/create" } do
    let(:params) {{
      customer: {
        first_name: "Martha",
        last_name: "Washington",
        email: "martha@example.com",
        cc_emails: "george@example.com",
        organization: "ABC, Inc.",
        address: "123 Main Street",
        address2: "Unit 10",
        city: "Anytown",
        state: "MA",
        zip: "02120",
        country: "US",
        phone: "555-555-1212",
        reference: "chargify-ruby-customer"
      }
    }}

    it "creates a POST request for 'customers'" do
      expect(customers.client).to receive(:post).
        with("customers.json", params).and_call_original

      customers.create(params)
    end

    it "returns a Chargify::Models::Customer" do
      expect(customers.create(params)).
        to be_a Chargify::Models::Customer
    end
  end

  describe ".find", vcr: { cassette_name: "customers/find" } do
    let(:id) { 33100727 }

    it "creates a GET request for 'customers/:id'" do
      expect(customers.client).to receive(:get).
        with("customers/#{id}.json").and_call_original

      customers.find(id)
    end

    it "returns a Chargify::Models::Customer" do
      expect(customers.find(id)).
        to be_a Chargify::Models::Customer
    end
  end

  describe ".list", vcr: { cassette_name: "customers/list" } do
    let(:params) {{ page: 1 }}

    it "creates a GET request for 'customers'" do
      expect(customers.client).to receive(:get).
        with("customers.json", params).and_call_original

      customers.list(params)
    end

    it "returns a Chargify::Collection of Models::Customer", :aggregate_failures do
      result = customers.list(params)

      expect(result).to be_a Chargify::Collection
      expect(result).to all be_a Chargify::Models::Customer
    end
  end

  describe ".lookup", vcr: { cassette_name: "customers/lookup" } do
    let(:reference) { "chargify-ruby-customer" }

    it "creates a GET request for 'customers/lookup'" do
      expect(customers.client).to receive(:get).
        with("customers/lookup.json", reference: reference).
        and_call_original

      customers.lookup(reference)
    end

    it "returns a Chargify::Models::Customer" do
      expect(customers.lookup(reference)).
        to be_a Chargify::Models::Customer
    end
  end
end
