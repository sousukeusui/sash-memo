require "test_helper"

class ConfirmMailerTest < ActionMailer::TestCase
  test "send_when_sign_up_step1" do
    mail = ConfirmMailer.send_when_sign_up_step1
    assert_equal "Send when sign up step1", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
