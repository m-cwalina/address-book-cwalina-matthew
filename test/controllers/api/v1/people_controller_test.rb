require "test_helper"

class Api::V1::PeopleControllerTest < ActionDispatch::IntegrationTest

def setup
  @current_user = users(:one)
end

  test 'should create a person' do
    assert_difference 'Person.count' do
      post '/api/v1/people',
           params: { person: { salutation: "Mr",
                               first_name: 'Paul',
                               middle_name: 'Oleary',
                               last_name: "Sanders",
                               SSN: "SSN",
                               birth_date: DateTime.now,
                               comment: "Blah blah blah"
                              },
                              email_attributes: {
                                id: 264,
                                email_address: "coolit@gmail.com",
                                comment: "blah blah blah"
                              },
                              address_attributes: {
                                id: 267,
                                town: "HB",
                                street: "1511 King St.",
                                zipcode: "2345",
                                state: "CA",
                                country: "USA",
                              },
                              phone_number_attributes: {
                                id: 268,
                                phone_number: "21312343241",
                                comment: "Blah blah blah"
                              }}
    end
  end
end
