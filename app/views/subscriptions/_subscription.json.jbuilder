# Don't return nil fields.
json.ignore_nil! true

# Basic Subscription fields.
json.extract! subscription, :id, :email

json.url subscription_url(subscription, format: :json)

# Nested rules.
json.subscription_rules subscription.subscription_rules, partial: 'subscription_rules/subscription_rule', as: :subscription_rule
