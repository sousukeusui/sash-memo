class ConfirmMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_mailer.send_when_sign_up_step1.subject
  #
  def send_when_sign_up_step1(email:, name:, confirmation_code:)
    @name = name
    @confirmation_code = confirmation_code
    mail to: email, subject: '認証コードの送付'
  end
end
