require "spec_helper"

describe Chargify::Api::Components do
  subject(:components) { described_class }

  describe ".lookup", vcr: { cassette_name: "components/lookup" } do
    let(:handle) { "chargify-ruby-component" }

    it "creates a GET request for 'components/lookup'" do
      expect(components.client).to receive(:get).
        with("components/lookup.json", handle: handle).
        and_call_original

      components.lookup(handle)
    end

    it "returns a Chargify::Models::Component" do
      expect(components.lookup(handle)).
        to be_a Chargify::Models::Component
    end
  end
end
