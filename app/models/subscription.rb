# A Subscription to the job posting service, for notification purposes.
class Subscription < ApplicationRecord
  validates :email, uniqueness: true, presence: true
end
