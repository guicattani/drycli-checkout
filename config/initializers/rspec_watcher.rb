# frozen_string_literal: true

require 'rspec-watcher'
require 'zeitwerk'

RSpecWatcher.configure do
  self.path_inferrer = ->(path) { File.expand_path(path, Dir.pwd) }

  self.reloader = -> {
    Zeitwerk::Registry.loaders.each(&:reload)
    RSpec.clear_examples if defined?(RSpec)
    RSpec.world.reset if defined?(RSpec) && RSpec.world.respond_to?(:reset)
  }

  watch 'spec', only: /_spec\.rb\z/ do |modified, added, _removed|
    modified + added
  end

  watch 'lib', only: /\.rb\z/ do |modified, added, removed|
    (modified + added + removed).map do |path|
      file_path = Pathname.new(path).relative_path_from(File.expand_path(path, Dir.pwd))
      spec_path = file_path.sub(/.rb\z/, '_spec.rb')
      "#{Dir.pwd}/spec/#{spec_path}"
    end
  end
end
