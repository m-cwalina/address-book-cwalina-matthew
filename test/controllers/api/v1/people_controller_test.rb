require "test_helper"

class Api::V1::PeopleControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    @person = people(:one)
    sign_in_as(@user, 'password')
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

  test "get index" do
    get '/api/v1/people'
    assert_response :success
  end

  test "update person" do
    updated_name = "Jose"

    patch '/api/v1/people/1',
      params: {person: { salutation: @person.salutation,
                         first_name: updated_name,
                         middle_name: @person.middle_name,
                         last_name: @person.last_name,
                         SSN: @person.SSN,
                         birth_date: @person.birth_date,
                         comment: @person.comment
                        }}

    assert_not_equal updated_name, @person.first_name
  end

  test 'destroy person' do
    assert_difference 'Person.count', -1 do
      delete '/api/v1/people/1'
    end
  end

end
