module Chargify
  module Models
    class Component < Model
      class Price < Model
        attribute :id
        attribute :component_id
        attribute :starting_quantity
        attribute :ending_quantity
        attribute :unit_price
        attribute :price_point_id
        attribute :formatted_unit_price
        attribute :segment_id
      end

      attribute :id
      attribute :name
      attribute :handle
      attribute :pricing_scheme
      attribute :unit_name
      attribute :unit_price
      attribute :product_family_id
      attribute :product_family_name
      attribute :price_per_unit_in_cents
      attribute :kind
      attribute :archived
      attribute :taxable
      attribute :description
      attribute :default_price_point_id
      attribute :price_point_count
      attribute :price_points_url
      attribute :default_price_point_name
      attribute :tax_code
      attribute :recurring
      attribute :upgrade_charge
      attribute :downgrade_credit
      attribute :created_at, Types::Params::DateTime
      attribute :hide_date_range_on_invoice
      attribute :allow_fractional_quantities

      # Associations
      attribute :prices, [Price]
    end
  end
end
