require 'active_record'
require 'simplecov'
require 'simplecov-csv'
SimpleCov.formatter = SimpleCov::Formatter::CSVFormatter
SimpleCov.coverage_dir(ENV["COVERAGE_REPORTS"])
SimpleCov.start

cnf = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), 'config.yml'))
config_block = ENV['TEST_CONFIG'] || 'test'
cnf = cnf[config_block]

ActiveRecord::Base.establish_connection(cnf)

RSpec.configure do |config|
  config.order = "random"
end
