json.array! @people do |person|
  json.extract! person, :id, :first_name, :middle_name, :last_name
end
