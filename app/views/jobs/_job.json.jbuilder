# Don't return nil fields.
json.ignore_nil! true

# Basic Job fields.
json.extract! job, :id, :name, :country, :salary

# Add a url for the resource if it is one of our own.
json.url job_url(job, format: :json) if job.persisted?

# Add an array of skills.
json.skills job.skill_names
