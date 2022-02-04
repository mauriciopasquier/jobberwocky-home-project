require 'test_helper'

class JobTest < Minitest::Spec
  let(:job) { create :job }

  it 'requires name' do
    _(build(:job, name: nil)).wont_be :valid?
  end

  it 'can have skills' do
    _(job.skills).must_be :empty?

    skill = build(:skill)
    job.skills << skill

    _(job.skills.include?(skill)).must_equal true
  end
end
