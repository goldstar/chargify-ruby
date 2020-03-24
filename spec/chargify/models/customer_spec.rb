require "spec_helper"

describe Chargify::Models::Customer do
  let(:params) {{
    "first_name" => "Martha",
    "last_name" => "Washington",
    "email" => "martha@example.com",
    "cc_emails" => "george@example.com",
    "organization" => "ABC, Inc.",
    "reference" => "chargify-ruby-customer",
    "id" => 33100727,
    "created_at" => "2020-03-23T13:18:32-07:00",
    "updated_at" => "2020-03-23T13:18:32-07:00",
    "address" => "123 Main Street",
    "address_2" => nil,
    "city" => "Anytown",
    "state" => "MA",
    "zip" => "02120",
    "country" => "US",
    "phone" => "555-555-1212",
    "verified" => false,
    "portal_customer_created_at" => nil,
    "portal_invite_last_sent_at" => nil,
    "portal_invite_last_accepted_at" => nil,
    "tax_exempt" => false,
    "vat_number" => nil,
    "parent_id" => nil
  }}

  subject(:order) { described_class.new(params) }

  its(:first_name) { is_expected.to eq params["first_name"] }
  its(:last_name) { is_expected.to eq params["last_name"] }
  its(:email) { is_expected.to eq params["email"] }
  its(:cc_emails) { is_expected.to eq params["cc_emails"] }
  its(:organization) { is_expected.to eq params["organization"] }
  its(:reference) { is_expected.to eq params["reference"] }
  its(:id) { is_expected.to eq params["id"] }
  its(:created_at) { is_expected.to eq DateTime.parse(params["created_at"]) }
  its(:updated_at) { is_expected.to eq DateTime.parse(params["updated_at"]) }
  its(:address) { is_expected.to eq params["address"] }
  its(:address_2) { is_expected.to eq params["address_2"] }
  its(:city) { is_expected.to eq params["city"] }
  its(:state) { is_expected.to eq params["state"] }
  its(:zip) { is_expected.to eq params["zip"] }
  its(:country) { is_expected.to eq params["country"] }
  its(:phone) { is_expected.to eq params["phone"] }
  its(:verified) { is_expected.to eq params["verified"] }
  its(:portal_customer_created_at) { is_expected.to eq params["portal_customer_created_at"] }
  its(:portal_invite_last_sent_at) { is_expected.to eq params["portal_invite_last_sent_at"] }
  its(:portal_invite_last_accepted_at) { is_expected.to eq params["portal_invite_last_accepted_at"] }
  its(:tax_exempt) { is_expected.to eq params["tax_exempt"] }
  its(:vat_number) { is_expected.to eq params["vat_number"] }
  its(:parent_id) { is_expected.to eq params["parent_id"] }
end
