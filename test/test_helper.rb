ENV["RAILS_ENV"] ||= "test"

# require "simplecov"
# SimpleCov.start "rails" do
#   add_filter "vendor"
#   add_filter "test"

#   add_group "Validators", "app/validators"
#   add_group "Uploaders", "app/uploaders"
# end

require File.expand_path("../../config/environment", __FILE__)
# require "codeclimate-test-reporter"
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"
# require "capybara/poltergeist"

# Capybara.javascript_driver = :poltergeist
# CodeClimate::TestReporter.start

Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

# config
module ActiveSupport
  class TestCase
    include FactoryGirl::Syntax::Methods

    ActiveRecord::Migration.check_pending!
    # Setup all fixtures in test/fixtures/*.yml
    # for all tests in alphabetical order.
    fixtures :all

    DatabaseRewinder.strategy = :transcation

    after { DatabaseRewinder.clean }
    # Add more helper methods to be used by all tests here...
  end
end
