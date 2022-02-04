# A Subscription to the job posting service, for notification purposes.
class Subscription < ApplicationRecord
  has_many :subscription_rules

  validates :email, uniqueness: true, presence: true

  accepts_nested_attributes_for :subscription_rules, allow_destroy: true
end
