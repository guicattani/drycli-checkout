# frozen_string_literal: true

class Config
  include Singleton
  def self.item(code)
    instance.item(code)
  end

  def item(code)
    config['items'][code]
  end

  def self.version
    instance.version
  end

  def version
    config['version']
  end

  private

  def config
    if ENV['environment'] == 'production'
      @config ||= Psych.load_file('config.yaml')
    else
      Psych.load_file('config.yaml')
    end
  end
end
