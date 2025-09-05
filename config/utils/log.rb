# frozen_string_literal: true

require 'logger'

module Utils
  class Log
    include Singleton

    LOG_DIR = "#{Dir.pwd}/logs"

    def initialize
      @today = Date.today
      new_logger
    end

    def self.warn(message)
      instance.warn(message)
    end

    def warn(message)
      check_date
      @logger.warn(message)
    end

    def self.error(message)
      instance.error(message)
    end

    def error(message)
      check_date
      @logger.error(message)
    end

    private

    def new_logger
      Dir.mkdir(LOG_DIR) unless File.exist?(LOG_DIR)
      @logger = Logger.new("#{LOG_DIR}/#{Date.today}", File::WRONLY | File::APPEND | File::CREAT)
    end

    def check_date
      return if @today == Date.today

      new_logger
    end
  end
end
