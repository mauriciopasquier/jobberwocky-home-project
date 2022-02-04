class Job < ApplicationRecord
  has_and_belongs_to_many :skills

  validates :name, presence: true

  # Gets a list of skill names as strings and associates the corresponding
  # Skill model.
  def skills=(names = [])
    return unless names.present?

    # TODO, Normalize skill names.
    initialized_skills = names.collect do |name|
      Skill.find_or_create_by name: name
    end

    super initialized_skills
  end
end
