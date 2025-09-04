# frozen_string_literal: true

module Checkout
  module CLI
    class Calculate < Dry::CLI::Command
      desc 'Calculates the total price of the combination of given items'

      argument :items, type: :array, required: true, desc: 'Combination of items to calculate'

      def call(items:, **)
        pp items
      end
    end
  end
end
