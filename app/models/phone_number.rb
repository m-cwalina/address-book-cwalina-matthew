class PhoneNumber < ApplicationRecord
  belongs_to :person
  validates :phone_number, presence: true
end
