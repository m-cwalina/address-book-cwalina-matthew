require "test_helper"

class PhoneNumberTest < ActiveSupport::TestCase
  test "should not save phone number without number" do
    phone = PhoneNumber.new
    assert_not phone.save
  end

  test "should save number with all fields" do
    phone = PhoneNumber.new(phone_number: "1231324123", comment: "", person_id: 1)
    assert phone.save
  end
end
