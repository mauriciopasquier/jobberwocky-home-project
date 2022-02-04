require 'test_helper'

class ExtraSourceServiceTest < ActiveSupport::TestCase
  setup do
    @service = ExtraSourceService.new
  end

  test 'it parses a job response' do
    response = [
      'Jr Java Developer',
      '24000',
      'Argentina',
      ['Java', 'OOP']
    ]

    parsed_job = @service.parse_job(response)

    assert parsed_job.name == 'Jr Java Developer'
    assert parsed_job.salary == 24000
    assert parsed_job.country == 'Argentina'
    assert parsed_job.skill_names == ['Java', 'OOP']
  end
end
