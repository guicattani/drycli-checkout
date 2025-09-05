# frozen_string_literal: true

require_relative 'config/initializers/rspec_watcher'

desc 'Start RSpec file watcher'
task :watch do
  puts 'Starting RSpec watcher...'
  RSpecWatcher.start

  begin
    sleep # Keep the task running
  rescue Interrupt
    puts "\nStopping RSpec watcher..."
  end
end

desc 'Run RSpec tests'
task :spec do
  require 'rspec/core'
  RSpec::Core::Runner.run(['spec'])
end

desc 'Run the main CLI application'
task :run, [:args] do |_t, args|
  cmd_args = args[:args] || ''
  ruby "main.rb #{cmd_args}"
end

desc 'IRB Console'
task :console do
  require_relative 'config/initializers/zeitwerk'

  Zeitwerk::Loader.eager_load_all
  require 'pry'
  Pry.start
end

task default: :spec
