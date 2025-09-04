# frozen_string_literal: true

require 'rspec-watcher'

RSpecWatcher.configure do
  self.path_inferrer = ->(path) { File.expand_path(path, Dir.pwd) }

  self.reloader = -> {} # (empty since we're not using it)

  watch 'spec', only: /_spec\.rb\z/ do |modified, added, _removed|
    modified + added
  end
end
