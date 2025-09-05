# frozen_string_literal: true

require 'singleton'
require 'psych'

class Config
  include Singleton

  DEFAULT_PATH = 'config/config.yaml'

  attr_reader :path

  def self.set_path(path = nil)
    instance.set_path(path)
  end

  def set_path(path = nil)
    @path = path || DEFAULT_PATH
  end

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
      @config ||= Psych.safe_load(path || DEFAULT_PATH, aliases: true, symbolize_names: true)
    else
      Psych.load_file(path || DEFAULT_PATH, aliases: true, symbolize_names: true) # no cache
    end
  end
end
