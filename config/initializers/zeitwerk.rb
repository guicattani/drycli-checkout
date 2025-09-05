# frozen_string_literal: true

require 'zeitwerk'

loader = Zeitwerk::Loader.new
root_dir = File.expand_path('../..', __dir__)
loader.push_dir(File.join(root_dir, 'lib'))
loader.push_dir(File.join(root_dir, 'config'))
loader.push_dir(File.join(root_dir, 'app', 'models'), namespace: Object)
loader.push_dir(File.join(root_dir, 'app', 'services'), namespace: Object)

loader.inflector.inflect('cli' => 'CLI')
loader.ignore(File.join(root_dir, 'config', 'initializers'))
loader.enable_reloading

loader.setup

# Enable eager loading for rake console
loader.eager_load if ENV['EAGER_LOAD'] == 'true'
