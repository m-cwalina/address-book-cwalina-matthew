json.array! @people do |person|
  json.extract! person, :id, :first_name, :middle_name, :last_name
  json.address person.addresses do |address|
    json.street address.street
    json.town address.town
    json.zip_code address.zip_code
    json.country address.country
  end
  json.email person.emails do |email|
    json.address email.email_address
    json.comment email.comment
  end
  json.phone_numbers person.phone_numbers do |phone|
    json.number phone.phone_number
    json.comment phone.comment
  end
end
