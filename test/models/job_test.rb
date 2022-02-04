require 'test_helper'

class JobTest < ActiveSupport::TestCase
  setup do
    @job = create :job
  end

  test 'it requires name' do
    refute build(:job, name: nil).valid?
  end

  test 'it can have skills' do
    assert @job.skills.empty?

    skill = build(:skill)
    @job.skills << skill

    assert @job.skills.include?(skill)
  end

  test 'it returns an array of skill names' do
    @job.skills = ['Ruby', 'React']

    assert @job.skill_names == ['Ruby', 'React']
  end
end
