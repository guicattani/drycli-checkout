# frozen_string_literal: true

require 'singleton'
require 'psych'

class Config
  include Singleton

  def self.item(code)
    instance.item(code)
  end

  def item(code)
    config[:items][code.to_sym]
  end

  def self.version
    instance.version
  end

  def version
    config[:version]
  end

  private

  def config
    if ENV['environment'] == 'production'
      @config ||= Psych.safe_load('config/config.yaml', aliases: true, symbolize_names: true)
    else
      Psych.load_file('config/config.yaml', aliases: true, symbolize_names: true) # no cache
    end
  end
end
