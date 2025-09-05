# frozen_string_literal: true

require 'zeitwerk'

loader = Zeitwerk::Loader.new
root_dir = File.expand_path('../..', __dir__)
loader.push_dir(File.join(root_dir, 'lib'))
loader.push_dir(File.join(root_dir, 'config'))

loader.inflector.inflect('cli' => 'CLI')
loader.ignore(File.join(root_dir, 'config', 'initializers'))
loader.setup

# Enable eager loading for console/development use
loader.eager_load if ENV['EAGER_LOAD'] == 'true'
