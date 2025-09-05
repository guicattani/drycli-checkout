#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
require 'dry/cli'
require_relative 'config/utils/logger'
require_relative 'config/initializers/zeitwerk'

module Checkout
  module CLI
    extend Dry::CLI::Registry

    # Reference the constants to trigger autoloading
    register 'calculate', Checkout::CLI::Calculate
    register 'version', Checkout::CLI::Version
  end
end

Dry::CLI.new(Checkout::CLI).call
