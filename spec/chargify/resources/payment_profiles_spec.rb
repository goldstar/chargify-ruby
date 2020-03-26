require "spec_helper"

describe Chargify::Api::PaymentProfiles do
  subject(:payment_profiles) { described_class }

  describe ".list", vcr: { cassette_name: "payment_profiles/list" } do
    let(:params) {{ page: 1 }}

    it "creates a GET request for 'payment_profiles'" do
      expect(payment_profiles.client).to receive(:get).
        with("payment_profiles.json", params).and_call_original

      payment_profiles.list(params)
    end

    it "returns a Chargify::Collection of Models::PaymentProfile", :aggregate_failures do
      result = payment_profiles.list(params)

      expect(result).to be_a Chargify::Collection
      expect(result).to all be_a Chargify::Models::PaymentProfile
    end
  end

  describe ".find", vcr: { cassette_name: "payment_profiles/find" } do
    let(:id) { 22922729 }

    it "creates a GET request for 'payment_profiles/:id'" do
      expect(payment_profiles.client).to receive(:get).
        with("payment_profiles/#{id}.json").and_call_original

      payment_profiles.find(id)
    end

    it "returns a Chargify::Models::PaymentProfile" do
      expect(payment_profiles.find(id)).
        to be_a Chargify::Models::PaymentProfile
    end
  end
end
