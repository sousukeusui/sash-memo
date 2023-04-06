# Preview all emails at http://localhost:3000/rails/mailers/confirm_mailer
class ConfirmMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/confirm_mailer/send_when_sign_up_step1
  def send_when_sign_up_step1
    ConfirmMailer.send_when_sign_up_step1
  end

end
