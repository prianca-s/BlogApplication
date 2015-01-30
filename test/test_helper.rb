ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

#require 'factory_girl_rails'
#FactoryGirl.find_definitions
#require 'capybara/rspec'



class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  include Devise::TestHelpers
  #config.include FactoryGirl::Syntax::Methods
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
