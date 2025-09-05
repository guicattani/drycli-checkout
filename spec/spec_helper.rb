# frozen_string_literal: true

ENV['environment'] = 'test'

require 'pry'
require_relative '../config/initializers/zeitwerk'
require 'simplecov'
SimpleCov.start
