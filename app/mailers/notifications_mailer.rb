class NotificationsMailer < ApplicationMailer
  def new_job(job)
    @job = job

    mail to: params[:subscription].email,
      subject: subject('We have a new job opportunity for you')
  end
end
