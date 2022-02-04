require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  test 'it requires name' do
    assert_not build(:skill, name: nil).valid?
  end
end
