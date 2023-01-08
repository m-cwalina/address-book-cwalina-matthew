require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without an email" do
    user = User.new
    assert_not user.save
  end

  test 'should save user with all fields' do
    user = User.new(email: "nsa@gmail.com", password_digest: 'password')
    assert user.save
  end
end
