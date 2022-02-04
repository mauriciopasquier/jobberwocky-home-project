class JobsController < ApplicationController
  before_action :filter, only: [:index]
  before_action :set_job, only: [:show]

  # GET /jobs
  def index
  end

  # GET /jobs/1
  def show
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)

    if @job.save
      render @job, status: :created
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def job_params
    params.require(:job).permit(:name, :country, :salary, skills: [])
  end

  # Scope chaining to filter results by param.
  def filter
    @jobs = Job.all
    @jobs = @jobs.with_name(params[:name]) if params[:name]
    @jobs = @jobs.with_skills(params[:skills]) if params[:skills]
  end
end
