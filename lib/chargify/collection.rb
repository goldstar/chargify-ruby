module Chargify
  class Collection
    include Enumerable
    extend Forwardable

    attr_reader :item_type, :response

    delegate each: :items

    def initialize(item_type, response)
      @item_type, @response = item_type, response
    end

    def [](value)
      items.force[value]
    end

    def items
      @items ||= Array(response).lazy.map do |item|
        item_type.new(item[item_key])
      end
    end

    protected

    def item_key
      item_type.to_s.demodulize.underscore
    end
  end
end
