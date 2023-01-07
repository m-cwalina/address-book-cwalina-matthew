json.extract! @person, :id, :first_name, :middle_name, :last_name
json.emails @person.emails
json.addresses @person.addresses
json.phone_numbers @person.phone_numbers
