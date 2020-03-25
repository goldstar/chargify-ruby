module Chargify
  module Models
    class CreditCard < Model
      attribute :id
      attribute :first_name
      attribute :last_name
      attribute :masked_card_number
      attribute :card_type
      attribute :expiration_month
      attribute :expiration_year
      attribute :customer_id
      attribute :current_vault
      attribute :vault_token
      attribute :billing_address
      attribute :billing_city
      attribute :billing_state
      attribute :billing_zip
      attribute :billing_country
      attribute :customer_vault_token
      attribute :billing_address_2
      attribute :payment_type
      attribute :disabled
    end
  end
end
