ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Make factories available in all test cases
  include FactoryBot::Syntax::Methods
  # Include URL helpers like `jobs_url`
  include Rails.application.routes.url_helpers

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Helper for accessing the response as parsed json.
  def json
    JSON.parse(@response.body)
  end
end
