require_relative "product_family"

module Chargify
  module Models
    class Product < Model
      class SignupPage < Model
        attribute :id
        attribute :return_url
        attribute :return_params
        attribute :url
      end

      attribute :id
      attribute :name
      attribute :handle
      attribute :description
      attribute :accounting_code
      attribute :request_credit_card
      attribute :expiration_interval
      attribute :expiration_interval_unit
      attribute :created_at
      attribute :updated_at
      attribute :price_in_cents
      attribute :interval
      attribute :interval_unit
      attribute :initial_charge_in_cents
      attribute :trial_price_in_cents
      attribute :trial_interval
      attribute :trial_interval_unit
      attribute :archived_at
      attribute :require_credit_card
      attribute :return_params
      attribute :taxable
      attribute :update_return_url
      attribute :tax_code
      attribute :initial_charge_after_trial
      attribute :version_number
      attribute :update_return_params
      attribute :default_product_price_point_id
      attribute :product_price_point_id
      attribute :product_price_point_name
      attribute :product_price_point_handle

      # Associations
      attribute :product_family, Models::ProductFamily
      attribute :public_signup_pages, [SignupPage]
    end
  end
end
