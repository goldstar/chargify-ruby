require "spec_helper"

describe Chargify::Models::PaymentProfile do
  let(:params) {{
    "id" => 22922729,
    "first_name" => "Alysa",
    "last_name" => "Test",
    "masked_card_number" => "XXXX-XXXX-XXXX-1111",
    "card_type" => "visa",
    "expiration_month" => 10,
    "expiration_year" => 2030,
    "customer_id" => 33145282,
    "current_vault" => "braintree_blue",
    "vault_token" => "803871154",
    "billing_address" => "123 Mass Ave.",
    "billing_city" => "Boston",
    "billing_state" => "MA",
    "billing_zip" => "02120",
    "billing_country" => "US",
    "customer_vault_token" => nil,
    "billing_address_2" => nil,
    "payment_type" => "credit_card",
    "disabled" => false
  }}

  subject(:payment_profile) { described_class.new(params) }

  its(:id) { is_expected.to eq params["id"] }
  its(:first_name) { is_expected.to eq params["first_name"] }
  its(:last_name) { is_expected.to eq params["last_name"] }
  its(:masked_card_number) { is_expected.to eq params["masked_card_number"] }
  its(:card_type) { is_expected.to eq params["card_type"] }
  its(:expiration_month) { is_expected.to eq params["expiration_month"] }
  its(:expiration_year) { is_expected.to eq params["expiration_year"] }
  its(:customer_id) { is_expected.to eq params["customer_id"] }
  its(:current_vault) { is_expected.to eq params["current_vault"] }
  its(:vault_token) { is_expected.to eq params["vault_token"] }
  its(:billing_address) { is_expected.to eq params["billing_address"] }
  its(:billing_city) { is_expected.to eq params["billing_city"] }
  its(:billing_state) { is_expected.to eq params["billing_state"] }
  its(:billing_zip) { is_expected.to eq params["billing_zip"] }
  its(:billing_country) { is_expected.to eq params["billing_country"] }
  its(:customer_vault_token) { is_expected.to eq params["customer_vault_token"] }
  its(:billing_address_2) { is_expected.to eq params["billing_address_2"] }
  its(:payment_type) { is_expected.to eq params["payment_type"] }
  its(:disabled) { is_expected.to eq params["disabled"] }
end
