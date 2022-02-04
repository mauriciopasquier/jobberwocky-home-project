require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get jobs_path, as: :json

    assert_response :success
  end

  test 'should create job' do
    job = create :job

    assert_difference('Job.count') do
      post jobs_path,
        params: { job: { country: job.country, name: job.name, salary: job.salary } }, as: :json
    end

    assert_response :created
  end

  test 'should show job' do
    job = create :job

    get job_url(job), as: :json

    assert_response :success
  end
end
