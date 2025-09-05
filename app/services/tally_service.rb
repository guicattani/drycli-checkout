# frozen_string_literal: true

class TallyService
  def self.call(items:)
    new.call(items:)
  end

  def call(items:)
    return if items.empty?

    tally_up(items)
  end

  private

  def tally_up(items)
    items.tally.filter_map do |code, count|
      item = Item.find(code)
      if item
        { item:, count:, sum: item.price_in_cents * count }
      else
        Utils::Log.error("#{code} not found")
        nil
      end
    end
  end
end
