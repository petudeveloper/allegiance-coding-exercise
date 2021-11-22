require "test_helper"

class TechRequestMailerTest < ActionMailer::TestCase
  test "request_sent" do
    mail = TechRequestMailer.request_sent
    assert_equal "Request sent", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
