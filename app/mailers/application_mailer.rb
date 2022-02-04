class ApplicationMailer < ActionMailer::Base
  # FIXME, Extract to configuration
  default from: 'from@example.com'
  layout 'mailer'

  def subject(message)
    "Jobberwocky | #{message}"
  end
end
