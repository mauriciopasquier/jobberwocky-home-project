require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    ExtraSourceService.stub_any_instance(:jobs, []) do
      get jobs_path, as: :json
    end

    assert_response :success
  end

  test 'should filter jobs by name' do
    create :job, name: 'first'
    create :job, name: 'second'

    ExtraSourceService.stub_any_instance(:jobs, []) do
      get jobs_path(name: 'first'), as: :json
    end

    assert_response :success
    assert json.size == 1
    assert json.first['name'] == 'first'
  end

  test 'should filter jobs by skill' do
    ['Ruby', 'React', 'Python'].each { |skill| create :skill, name: skill }

    create :job, name: 'first', skills: ['Ruby', 'React']
    create :job, name: 'second', skills: ['Python', 'React']

    ExtraSourceService.stub_any_instance(:jobs, []) do
      get jobs_path(skills:  ['Ruby']), as: :json
    end

    assert_response :success
    assert json.size == 1
    assert json.first['name'] == 'first'

    ExtraSourceService.stub_any_instance(:jobs, []) do
      get jobs_path(skills:  ['React']), as: :json
    end

    assert json.size == 2
  end

  test 'should create job' do
    job = build :job

    assert_difference('Job.count') do
      post jobs_path,
        params: { job: { country: job.country, name: job.name, salary: job.salary } }, as: :json
    end

    assert_response :created
  end

  test 'should create job with skills' do
    job = build :job
    skill = create :skill

    assert_difference('Job.count') do
      post jobs_path,
        params: { job: { name: job.name, skills: [skill.name] } }, as: :json
    end

    assert_response :created
    assert Job.find_by(name: job.name).skills.include?(skill)
  end

  test 'should show job' do
    job = create :job

    get job_url(job), as: :json

    assert_response :success
  end

  test 'should notify subscriptors' do
    2.times { create :subscription }
    job = build :job

    assert_emails 2 do
      post jobs_path, params: { job: { name: job.name } }, as: :json
    end
  end
end
