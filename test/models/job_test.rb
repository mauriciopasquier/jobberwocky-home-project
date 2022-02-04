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
end
