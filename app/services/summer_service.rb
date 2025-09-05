# frozen_string_literal: true

class SummerService
  def self.call(tallied_items:)
    new.call(tallied_items:)
  end

  def call(tallied_items:)
    tallied_items.map do |item_and_count|
      item_and_count => { item:, count: }
    end
  end
end
