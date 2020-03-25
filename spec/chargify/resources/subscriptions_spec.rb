require "spec_helper"

describe Chargify::Api::Subscriptions do
  subject(:subscriptions) { described_class }

  describe ".create", vcr: { cassette_name: "subscriptions/create" } do
    let(:params) {{
      subscription: {
        product_handle: "gold",
        customer_attributes: {
          first_name: "Alysa",
          last_name: "Test",
          email: "alysa@example.com"
        },
        credit_card_attributes: {
          full_number: "4111111111111111",
          expiration_month: "10",
          expiration_year: "2030",
          card_type: "visa",
          cvv: "123",
          billing_zip: "02120",
          billing_state: "MA",
          billing_country: "US",
          billing_city: "Boston",
          billing_address: "123 Mass Ave."
        }
      }
    }}

    it "creates a POST request for 'subscriptions'" do
      expect(subscriptions.client).to receive(:post).
        with("subscriptions.json", params).and_call_original

      subscriptions.create(params)
    end

    it "returns a Chargify::Models::Subscription" do
      expect(subscriptions.create(params)).
        to be_a Chargify::Models::Subscription
    end
  end

  describe ".find", vcr: { cassette_name: "subscriptions/find" } do
    let(:id) { 32118769 }

    it "creates a GET request for 'subscriptions/:id'" do
      expect(subscriptions.client).to receive(:get).
        with("subscriptions/#{id}.json").and_call_original

      subscriptions.find(id)
    end

    it "returns a Chargify::Models::Subscription" do
      expect(subscriptions.find(id)).
        to be_a Chargify::Models::Subscription
    end
  end

  describe ".lookup", vcr: { cassette_name: "subscriptions/lookup" } do
    let(:reference) { "chargify-ruby-subscription" }

    it "creates a GET request for 'subscriptions/lookup'" do
      expect(subscriptions.client).to receive(:get).
        with("subscriptions/lookup.json", reference: reference).
        and_call_original

      subscriptions.lookup(reference)
    end

    it "returns a Chargify::Models::Subscription" do
      expect(subscriptions.lookup(reference)).
        to be_a Chargify::Models::Subscription
    end
  end
end
