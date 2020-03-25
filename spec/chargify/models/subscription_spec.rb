require "spec_helper"

describe Chargify::Models::Subscription do
  let(:params) {{
    "id" => 32118769,
    "state" => "active",
    "trial_started_at" => nil,
    "trial_ended_at" => nil,
    "activated_at" => "2020-03-24T20:17:24-07:00",
    "created_at" => "2020-03-24T20:17:20-07:00",
    "updated_at" => "2020-03-24T20:17:24-07:00",
    "expires_at" => "2021-03-24T20:17:24-07:00",
    "balance_in_cents" => 0,
    "current_period_ends_at" => "2020-04-24T20:17:20-07:00",
    "next_assessment_at" => "2020-04-24T20:17:20-07:00",
    "canceled_at" => "2020-04-24T20:17:20-07:00",
    "cancellation_message" => nil,
    "next_product_id" => nil,
    "next_product_handle" => nil,
    "cancel_at_end_of_period" => false,
    "payment_collection_method" => "automatic",
    "snap_day" => nil,
    "cancellation_method" => nil,
    "current_period_started_at" => "2020-03-24T20:17:20-07:00",
    "previous_state" => "active",
    "signup_payment_id" => 373242560,
    "signup_revenue" => "10.00",
    "delayed_cancel_at" => "2020-04-24T20:17:20-07:00",
    "coupon_code" => nil,
    "total_revenue_in_cents" => 1000,
    "product_price_in_cents" => 1000,
    "product_version_number" => 1,
    "payment_type" => "credit_card",
    "referral_code" => nil,
    "coupon_use_count" => nil,
    "coupon_uses_allowed" => nil,
    "reason_code" => nil,
    "automatically_resume_at" => "2020-04-24T20:17:20-07:00",
    "coupon_codes" => [],
    "offer_id" => nil,
    "payer_id" => nil,
    "receives_invoice_emails" => nil,
    "product_price_point_id" => 906882,
    "next_product_price_point_id" => nil,
    "net_terms" => nil,
    "stored_credential_transaction_id" => nil,
    "reference" => nil,
    "currency" => "USD",
    "customer" => {},
    "product" => {},
    "credit_card" => {}
  }}

  subject(:subscription) { described_class.new(params) }

  its(:id) { is_expected.to eq params["id"] }
  its(:state) { is_expected.to eq params["state"] }
  its(:trial_started_at) { is_expected.to eq params["trial_started_at"] }
  its(:trial_ended_at) { is_expected.to eq params["trial_ended_at"] }
  its(:activated_at) { is_expected.to eq DateTime.parse(params["activated_at"]) }
  its(:created_at) { is_expected.to eq DateTime.parse(params["created_at"]) }
  its(:updated_at) { is_expected.to eq DateTime.parse(params["updated_at"]) }
  its(:expires_at) { is_expected.to eq DateTime.parse(params["expires_at"]) }
  its(:balance_in_cents) { is_expected.to eq params["balance_in_cents"] }
  its(:current_period_ends_at) { is_expected.to eq DateTime.parse(params["current_period_ends_at"]) }
  its(:next_assessment_at) { is_expected.to eq DateTime.parse(params["next_assessment_at"]) }
  its(:canceled_at) { is_expected.to eq params["canceled_at"] }
  its(:cancellation_message) { is_expected.to eq params["cancellation_message"] }
  its(:next_product_id) { is_expected.to eq params["next_product_id"] }
  its(:next_product_handle) { is_expected.to eq params["next_product_handle"] }
  its(:cancel_at_end_of_period) { is_expected.to eq params["cancel_at_end_of_period"] }
  its(:payment_collection_method) { is_expected.to eq params["payment_collection_method"] }
  its(:snap_day) { is_expected.to eq params["snap_day"] }
  its(:cancellation_method) { is_expected.to eq params["cancellation_method"] }
  its(:current_period_started_at) { is_expected.to eq DateTime.parse(params["current_period_started_at"]) }
  its(:previous_state) { is_expected.to eq params["previous_state"] }
  its(:signup_payment_id) { is_expected.to eq params["signup_payment_id"] }
  its(:signup_revenue) { is_expected.to eq params["signup_revenue"] }
  its(:delayed_cancel_at) { is_expected.to eq DateTime.parse(params["delayed_cancel_at"]) }
  its(:coupon_code) { is_expected.to eq params["coupon_code"] }
  its(:total_revenue_in_cents) { is_expected.to eq params["total_revenue_in_cents"] }
  its(:product_price_in_cents) { is_expected.to eq params["product_price_in_cents"] }
  its(:product_version_number) { is_expected.to eq params["product_version_number"] }
  its(:payment_type) { is_expected.to eq params["payment_type"] }
  its(:referral_code) { is_expected.to eq params["referral_code"] }
  its(:coupon_use_count) { is_expected.to eq params["coupon_use_count"] }
  its(:coupon_uses_allowed) { is_expected.to eq params["coupon_uses_allowed"] }
  its(:reason_code) { is_expected.to eq params["reason_code"] }
  its(:automatically_resume_at) { is_expected.to eq DateTime.parse(params["automatically_resume_at"]) }
  its(:coupon_codes) { is_expected.to eq params["coupon_codes"] }
  its(:offer_id) { is_expected.to eq params["offer_id"] }
  its(:payer_id) { is_expected.to eq params["payer_id"] }
  its(:receives_invoice_emails) { is_expected.to eq params["receives_invoice_emails"] }
  its(:product_price_point_id) { is_expected.to eq params["product_price_point_id"] }
  its(:next_product_price_point_id) { is_expected.to eq params["next_product_price_point_id"] }
  its(:net_terms) { is_expected.to eq params["net_terms"] }
  its(:stored_credential_transaction_id) { is_expected.to eq params["stored_credential_transaction_id"] }
  its(:reference) { is_expected.to eq params["reference"] }
  its(:currency) { is_expected.to eq params["currency"] }
  its(:customer) { is_expected.to be_a Chargify::Models::Customer }
  its(:product) { is_expected.to be_a Chargify::Models::Product }
  its(:credit_card) { is_expected.to be_a Chargify::Models::PaymentProfile }
end
