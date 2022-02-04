require 'test_helper'

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test 'should create subscription' do
    subscription = build :subscription

    assert_difference('Subscription.count') do
      post subscriptions_path, params: { subscription: { email: subscription.email } }, as: :json
    end

    assert_response :created
  end

  test 'should show subscription' do
    subscription = create :subscription

    get subscription_url(subscription), as: :json

    assert_response :success
  end

  test 'should destroy subscription' do
    subscription = create :subscription

    assert_difference('Subscription.count', -1) do
      delete subscription_url(subscription), as: :json
    end

    assert_response :no_content
  end
end
