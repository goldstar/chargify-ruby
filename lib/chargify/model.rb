require "artisanal-model"
require_relative "types"

module Chargify
  class Model
    include Artisanal::Model(symbolize: true, defaults: { type: Types::Any })
  end
end
