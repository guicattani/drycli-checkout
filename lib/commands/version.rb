# frozen_string_literal: true

require_relative '../../config/config'

module Checkout
  module CLI
    class Version < Dry::CLI::Command
      desc 'Prints the current version of Checkout'

      def call(**)
        pp Config.version
      end
    end
  end
end
