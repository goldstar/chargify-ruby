require "spec_helper"

describe Chargify::Models::Component do
  let(:params) {{
    "id" => 957813,
    "name" => "Test Component",
    "handle" => "chargify-ruby-component",
    "pricing_scheme" => "per_unit",
    "unit_name" => "item",
    "unit_price" => "10.0",
    "product_family_id" => 1518096,
    "product_family_name" => "Acme Projects",
    "price_per_unit_in_cents" => nil,
    "kind" => "quantity_based_component",
    "archived" => false,
    "taxable" => false,
    "description" => nil,
    "default_price_point_id" => 821564,
    "prices" =>  [{}],
    "price_point_count" => 1,
    "price_points_url" => "https://goldstar-staging.chargify.com/components/957813/price_points",
    "default_price_point_name" => "Original",
    "tax_code" => "",
    "recurring" => true,
    "upgrade_charge" => nil,
    "downgrade_credit" => nil,
    "created_at" => "2020-03-24T21:08:42-07:00",
    "hide_date_range_on_invoice" => false,
    "allow_fractional_quantities" => false
  }}

  subject(:component) { described_class.new(params) }

  its(:id) { is_expected.to eq params["id"] }
  its(:name) { is_expected.to eq params["name"] }
  its(:handle) { is_expected.to eq params["handle"] }
  its(:pricing_scheme) { is_expected.to eq params["pricing_scheme"] }
  its(:unit_name) { is_expected.to eq params["unit_name"] }
  its(:unit_price) { is_expected.to eq params["unit_price"] }
  its(:product_family_id) { is_expected.to eq params["product_family_id"] }
  its(:product_family_name) { is_expected.to eq params["product_family_name"] }
  its(:price_per_unit_in_cents) { is_expected.to eq params["price_per_unit_in_cents"] }
  its(:kind) { is_expected.to eq params["kind"] }
  its(:archived) { is_expected.to eq params["archived"] }
  its(:taxable) { is_expected.to eq params["taxable"] }
  its(:description) { is_expected.to eq params["description"] }
  its(:default_price_point_id) { is_expected.to eq params["default_price_point_id"] }
  its(:prices) { is_expected.to all be_a Chargify::Models::Component::Price }
  its(:price_point_count) { is_expected.to eq params["price_point_count"] }
  its(:price_points_url) { is_expected.to eq params["price_points_url"] }
  its(:default_price_point_name) { is_expected.to eq params["default_price_point_name"] }
  its(:tax_code) { is_expected.to eq params["tax_code"] }
  its(:recurring) { is_expected.to eq params["recurring"] }
  its(:upgrade_charge) { is_expected.to eq params["upgrade_charge"] }
  its(:downgrade_credit) { is_expected.to eq params["downgrade_credit"] }
  its(:created_at) { is_expected.to eq DateTime.parse(params["created_at"]) }
  its(:hide_date_range_on_invoice) { is_expected.to eq params["hide_date_range_on_invoice"] }
  its(:allow_fractional_quantities) { is_expected.to eq params["allow_fractional_quantities"] }
end
