require "test_helper"

class LeadsMailerTest < ActionMailer::TestCase
  test "lead_created" do
    mail = LeadsMailer.lead_created
    assert_equal "Lead created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
