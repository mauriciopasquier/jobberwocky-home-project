# Preview all emails at http://localhost:3000/rails/mailers/notifications_mailer
class NotificationsMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/notifications_mailer/new_job
  def new_job
    NotificationsMailer.with(
      subscription: FactoryBot.create(:subscription)
    ).new_job(FactoryBot.create :job, :full)
  end
end
