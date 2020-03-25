require "spec_helper"

describe Chargify::Api::PaymentProfiles do
  subject(:payment_profiles) { described_class }

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
