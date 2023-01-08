require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test "should not save person without first name, last name, " do
    person = Person.new
    assert_not person.save
  end

  test "should save person with all fields, " do
    person = Person.new(salutation: "Mr",
                               first_name: 'Paul',
                               middle_name: 'Oleary',
                               last_name: "Sanders",
                               SSN: "SSN",
                               birth_date: DateTime.now,
                               comment: "Blah blah blah")
    assert person.save
  end
end
