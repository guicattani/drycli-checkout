# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '3.4.4'

gem 'dotenv'
gem 'dry-cli'
gem 'logger'
gem 'rake'
gem 'singleton'

group :development do
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rake'
  gem 'rubocop-rspec'
end

group :test do
  gem 'listen'
  gem 'rspec'
  gem 'rspec-watcher'
end
