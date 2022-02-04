ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/spec'

class ActiveSupport::TestCase
  # Make factories available in all test cases
  include FactoryBot::Syntax::Methods

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Add more helper methods to be used by all tests here...
end

class Minitest::Spec
  # Make factories available in all test cases
  include FactoryBot::Syntax::Methods
end
