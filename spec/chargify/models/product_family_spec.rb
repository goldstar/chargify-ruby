require "spec_helper"

describe Chargify::Models::ProductFamily do
  let(:params) {{
    "id" => 1518096,
    "name" => "Acme Projects",
    "description" => "Amazing project management tool",
    "handle" => "acme-projects",
    "accounting_code" => nil
  }}

  subject(:product_family) { described_class.new(params) }

  its(:id) { is_expected.to eq params["id"] }
  its(:name) { is_expected.to eq params["name"] }
  its(:description) { is_expected.to eq params["description"] }
  its(:handle) { is_expected.to eq params["handle"] }
  its(:accounting_code) { is_expected.to eq params["accounting_code"] }
end
