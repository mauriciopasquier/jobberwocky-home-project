# Don't return nil fields.
json.ignore_nil! true

# Basic Rule fields.
json.extract! subscription_rule, :name, :salary_min, :salary_max, :country
