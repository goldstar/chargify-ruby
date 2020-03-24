RSpec.describe Chargify do
  it "has a version number" do
    expect(Chargify::VERSION).not_to be nil
  end

  describe ".[]" do
    it "registers and memoizes a new Chargify site", :aggregate_failures do
      expect(Chargify.const_defined?("Example")).to eq false

      Chargify[:example]

      expect(Chargify.const_defined?("Example")).to eq true
      expect(Chargify::Example).to eq Chargify[:example]
    end
  end
end
