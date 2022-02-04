require 'test_helper'

class SkillTest < Minitest::Spec
  it 'requires name' do
    _(build(:skill, name: nil)).wont_be :valid?
  end
end
