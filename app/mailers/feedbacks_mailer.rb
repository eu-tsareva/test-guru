class FeedbacksMailer < ApplicationMailer
  def feedback(message, emails)
    @message = message

    mail to: emails, subject: 'New feedback received!'
  end
end
