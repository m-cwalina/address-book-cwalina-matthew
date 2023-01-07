json.extract! @person, :id, :first_name, :middle_name, :last_name
json.email @person.emails
json.address @person.addresses
json.phone_number @person.phone_numbers
