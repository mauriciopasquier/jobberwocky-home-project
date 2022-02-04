require 'test_helper'

class SubscriptionRuleTest < ActiveSupport::TestCase
  test 'it requires a subscription' do
    assert_not build(:subscription_rule, subscription: nil).valid?
  end
end
