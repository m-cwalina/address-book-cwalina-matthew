require "test_helper"

class EmailTest < ActiveSupport::TestCase
  test "should not save email without email_address" do
    email = Email.new
    assert_not email.save
  end

  test "should save email with all fields" do
    email = Email.new(email_address: "3@gmail.com", comment: "", person_id: 1)
    assert email.save
  end
end
