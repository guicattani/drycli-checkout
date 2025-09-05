# frozen_string_literal: true

require 'dry/cli'
module Checkout
  module CLI
    class Calculate < Dry::CLI::Command
      desc 'Calculates the total price of the combination of given items'

      argument :items, type: :array, required: true, desc: 'Combination of items to calculate'

      def call(items:, **)
        return if items.empty?

        mapped_items = items.filter_map do |i|
          item = Item.find(i)
          Utils::Log.error("#{i} not found") unless item
          item
        end
        sum = mapped_items.sum(&:price_in_cents)

        format('£%0.02f', sum / 100.0)
      end
    end
  end
end
