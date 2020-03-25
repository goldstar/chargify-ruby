module Chargify
  module Models
    class Subscription < Model
      attribute :id
      attribute :state
      attribute :trial_started_at
      attribute :trial_ended_at
      attribute :activated_at, Types::Params::DateTime
      attribute :created_at, Types::Params::DateTime
      attribute :updated_at, Types::Params::DateTime
      attribute :expires_at, Types::Params::DateTime
      attribute :balance_in_cents
      attribute :current_period_ends_at, Types::Params::DateTime
      attribute :next_assessment_at, Types::Params::DateTime
      attribute :canceled_at
      attribute :cancellation_message
      attribute :next_product_id
      attribute :next_product_handle
      attribute :cancel_at_end_of_period
      attribute :payment_collection_method
      attribute :snap_day
      attribute :cancellation_method
      attribute :current_period_started_at, Types::Params::DateTime
      attribute :previous_state
      attribute :signup_payment_id
      attribute :signup_revenue
      attribute :delayed_cancel_at, Types::Params::DateTime
      attribute :coupon_code
      attribute :total_revenue_in_cents
      attribute :product_price_in_cents
      attribute :product_version_number
      attribute :payment_type
      attribute :referral_code
      attribute :coupon_use_count
      attribute :coupon_uses_allowed
      attribute :reason_code
      attribute :automatically_resume_at, Types::Params::DateTime
      attribute :coupon_codes
      attribute :offer_id
      attribute :payer_id
      attribute :receives_invoice_emails
      attribute :product_price_point_id
      attribute :next_product_price_point_id
      attribute :net_terms
      attribute :stored_credential_transaction_id
      attribute :reference
      attribute :currency

      # Associations
      attribute :customer, Models::Customer
      attribute :product, Models::Product
      attribute :credit_card, Models::PaymentProfile
    end
  end
end
