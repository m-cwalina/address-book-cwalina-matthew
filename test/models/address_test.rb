require "test_helper"

class AddressTest < ActiveSupport::TestCase
  test "should not save address without town" do
    address = PhoneNumber.new
    assert_not address.save
  end

  test "should save address with all fields" do
    address = Address.new(town: "1231324123", street: "1511 King St.", state: "CA", country: "USA", zip_code: "324321", person_id: 1)
    assert address.save
  end
end
