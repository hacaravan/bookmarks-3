
require 'capybara'
require 'capybara/rspec'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'simplecov'
require 'simplecov-console'

require_relative 'web_helpers'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
 SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
 ])
 SimpleCov.start


ENV['RACK ENV'] = 'test'
Capybara.app = BookmarkManager


RSpec.configure do |config|

  config.before(:each) do
    truncate_test_table
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

end
