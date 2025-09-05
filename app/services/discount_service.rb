# frozen_string_literal: true

class DiscountService
  def self.call(tallied_items:)
    new.call(tallied_items:)
  end

  def call(tallied_items:)
    subtotal = 0
    tallied_items.map do |item_count_sum|
      item_count_sum => { item:, count:, sum: }

      subtotal += apply_discount(count:, sum:, promotion: item.promotion).to_i
    end

    subtotal
  end

  private

  def apply_discount(count:, sum:, promotion:)
    return sum if promotion.nil? || promotion[:min_count] > count

    return sum * (1 - promotion[:discount]) if promotion[:applies_to_all]

    ineligible = sum % promotion[:min_count]
    eligible = count - ineligible

    ineligible_sum = 0
    ineligible_sum = sum * ineligible / count.to_f if ineligible.positive?
    eligible_sum = 0
    eligible_sum = sum * eligible / count.to_f * (1 - promotion[:discount]) if eligible.positive?

    ineligible_sum + eligible_sum
  end
end
