#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
require 'dry/cli'
require_relative 'config/initializers/zeitwerk'
require_relative 'config/utils/log'

module CLI
  extend Dry::CLI::Registry

  # Reference the constants to trigger autoloading
  register 'calculate', CLI::Calculate
  register 'version', CLI::Version
end

Dry::CLI.new(CLI).call
