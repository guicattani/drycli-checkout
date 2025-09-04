#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
require 'dry/cli'
require_relative 'lib/commands/calculate'
require_relative 'lib/commands/version'

module Checkout
  module CLI
    extend Dry::CLI::Registry

    register 'calculate', Calculate
    register 'version', Version
  end
end

Dry::CLI.new(Checkout::CLI).call
