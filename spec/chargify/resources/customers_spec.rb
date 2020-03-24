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
        reference: "1234567890",
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
end
