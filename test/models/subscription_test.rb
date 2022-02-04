require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  test 'it requires name' do
    assert_not build(:subscription, email: nil).valid?
  end

  test 'email is unique' do
    existing = create :subscription, email: 'existing@email.com'

    assert_not build(:subscription, email: existing.email).valid?
  end
end
