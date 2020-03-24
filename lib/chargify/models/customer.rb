module Chargify
  module Models
    class Customer < Model
      attribute :first_name
      attribute :last_name
      attribute :email
      attribute :cc_emails
      attribute :organization
      attribute :reference
      attribute :id
      attribute :created_at, Types::Params::DateTime
      attribute :updated_at, Types::Params::DateTime
      attribute :address
      attribute :address_2
      attribute :city
      attribute :state
      attribute :zip
      attribute :country
      attribute :phone
      attribute :verified
      attribute :portal_customer_created_at
      attribute :portal_invite_last_sent_at
      attribute :portal_invite_last_accepted_at
      attribute :tax_exempt
      attribute :vat_number
      attribute :parent_id
    end
  end
end
