# frozen_string_literal: true

class Item
  attr_reader :name, :price_in_cents, :promotion

  def initialize(name:, price_in_cents:, promotion:)
    @name = name
    @price_in_cents = price_in_cents
    @promotion = promotion
  end

  def self.find(code)
    cfg = Config.item(code)
    new(**cfg) if cfg
  end
end
