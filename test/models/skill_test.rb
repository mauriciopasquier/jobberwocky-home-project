require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  test 'it requires name' do
    refute build(:skill, name: nil).valid?
  end
end
