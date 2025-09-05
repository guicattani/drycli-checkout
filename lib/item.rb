# frozen_string_literal: true

class Item
  attr_reader :name, :price_in_cents

  def initialize(cfg)
    @name = cfg['name']
    @price_in_cents = cfg['price_in_cents']
  end

  def self.find(code)
    cfg = Config.item(code)
    new(cfg) if cfg
  end
end
