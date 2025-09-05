# frozen_string_literal: true

module Checkout
  module CLI
    class Version < Dry::CLI::Command
      desc 'Prints the current version of Checkout'

      def call(**)
        print "#{Config.version}\n"
      end
    end
  end
end
