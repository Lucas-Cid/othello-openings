require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "token" do
    mail = UserMailer.token
    assert_equal "Token", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
