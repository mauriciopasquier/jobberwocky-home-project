# A Subscription to the job posting service, for notification purposes.
class Subscription < ApplicationRecord
  has_many :subscription_rules

  validates :email, uniqueness: true, presence: true

  accepts_nested_attributes_for :subscription_rules, allow_destroy: true

  scope :without_rules, -> {
    includes(:subscription_rules).where(subscription_rules: { subscription_id: nil })
  }

  # Returns every subscription that match any of these rules.
  scope :with_rules, ->(rules) {
    scoped = joins(:subscription_rules)
    rules_table = SubscriptionRule.arel_table

    # By job name.
    where_chain = rules_table[:name].matches(rules[:name]) if rules[:name].present?

    # By job country.
    where_chain = where_chain.or(
      rules_table[:country].matches(rules[:country])
    ) if rules[:country].present?

    # By job salary, min and max.
    where_chain = where_chain.or(
      rules_table[:salary_min].gteq(rules[:salary])
    ) if rules[:salary].present?

    where_chain = where_chain.or(
      rules_table[:salary_max].lteq(rules[:salary])
    ) if rules[:salary].present?

    scoped.where(where_chain)
  }
end
