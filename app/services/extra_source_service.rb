# jobberwocky-extra-source wrapper.
class ExtraSourceService
  include HTTParty

  class RequestError < StandardError
  end

  base_uri 'http://localhost:8081'

  attr_accessor :response

  def jobs(query = {})
    self.response = self.class.get('/jobs', query: query).collect { |job| parse_job(job) }
  end

  # Parses a job as it comes from the external service, to our format.
  def parse_job(job)
    Job.new({
      name: job[0],
      salary: job[1],
      country: job[2],
      skills: job[3]
    })
  end
end
