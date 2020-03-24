require "spec_helper"

describe Chargify::Models::Product do
  let(:params) {{
    "id" => 5216049,
    "name" => "Gold Plan",
    "handle" => "gold",
    "description" => "This is our gold plan.",
    "accounting_code" => "123",
    "request_credit_card" => true,
    "expiration_interval" => nil,
    "expiration_interval_unit" => nil,
    "created_at" => "2020-03-24T14:43:53-07:00",
    "updated_at" => "2020-03-24T14:43:53-07:00",
    "price_in_cents" => 1000,
    "interval" => 1,
    "interval_unit" => "month",
    "initial_charge_in_cents" => nil,
    "trial_price_in_cents" => nil,
    "trial_interval" => nil,
    "trial_interval_unit" => nil,
    "archived_at" => nil,
    "require_credit_card" => true,
    "return_params" => nil,
    "taxable" => false,
    "update_return_url" => nil,
    "tax_code" => "D0000000",
    "initial_charge_after_trial" => false,
    "version_number" => 1,
    "update_return_params" => nil,
    "default_product_price_point_id" => 906882,
    "product_price_point_id" => 906882,
    "product_price_point_name" => "Original",
    "product_price_point_handle" => "uuid:7b08d7e0-5046-0138-acf5-0a7da89f880c",
    "product_family" => {},
    "public_signup_pages" => [{}]
  }}

  subject(:product) { described_class.new(params) }

  its(:id) { is_expected.to eq params["id"] }
  its(:name) { is_expected.to eq params["name"] }
  its(:handle) { is_expected.to eq params["handle"] }
  its(:description) { is_expected.to eq params["description"] }
  its(:accounting_code) { is_expected.to eq params["accounting_code"] }
  its(:request_credit_card) { is_expected.to eq params["request_credit_card"] }
  its(:expiration_interval) { is_expected.to eq params["expiration_interval"] }
  its(:expiration_interval_unit) { is_expected.to eq params["expiration_interval_unit"] }
  its(:created_at) { is_expected.to eq params["created_at"] }
  its(:updated_at) { is_expected.to eq params["updated_at"] }
  its(:price_in_cents) { is_expected.to eq params["price_in_cents"] }
  its(:interval) { is_expected.to eq params["interval"] }
  its(:interval_unit) { is_expected.to eq params["interval_unit"] }
  its(:initial_charge_in_cents) { is_expected.to eq params["initial_charge_in_cents"] }
  its(:trial_price_in_cents) { is_expected.to eq params["trial_price_in_cents"] }
  its(:trial_interval) { is_expected.to eq params["trial_interval"] }
  its(:trial_interval_unit) { is_expected.to eq params["trial_interval_unit"] }
  its(:archived_at) { is_expected.to eq params["archived_at"] }
  its(:require_credit_card) { is_expected.to eq params["require_credit_card"] }
  its(:return_params) { is_expected.to eq params["return_params"] }
  its(:taxable) { is_expected.to eq params["taxable"] }
  its(:update_return_url) { is_expected.to eq params["update_return_url"] }
  its(:tax_code) { is_expected.to eq params["tax_code"] }
  its(:initial_charge_after_trial) { is_expected.to eq params["initial_charge_after_trial"] }
  its(:version_number) { is_expected.to eq params["version_number"] }
  its(:update_return_params) { is_expected.to eq params["update_return_params"] }
  its(:default_product_price_point_id) { is_expected.to eq params["default_product_price_point_id"] }
  its(:product_price_point_id) { is_expected.to eq params["product_price_point_id"] }
  its(:product_price_point_name) { is_expected.to eq params["product_price_point_name"] }
  its(:product_price_point_handle) { is_expected.to eq params["product_price_point_handle"] }
  its(:product_family) { is_expected.to be_a Chargify::Models::ProductFamily }
  its(:public_signup_pages) { is_expected.to all be_a Chargify::Models::Product::SignupPage }
end
