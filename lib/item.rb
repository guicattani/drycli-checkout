# frozen_string_literal: true

class Item
  attr_reader :name, :price_in_cents

  def initialize(name, price_in_cents)
    @name = name
    @price_in_cents = price_in_cents
  end

  def find(code)
    new(Config.item(code))
  end
end
