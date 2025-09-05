#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'

class Checkout
  attr_writer :pricing_rules
  attr_reader :total

  def initialize(pricing_rules)
    Config.set_path(pricing_rules)
    @total = ''
    @scanned_items = []
  end

  def scan(item)
    @scanned_items << item
    tallied_items = TallyService.call(items: @scanned_items)

    sum = DiscountService.call(tallied_items:)
    @total = format('£%0.02f', sum / 100.0)
    nil
  end
end
