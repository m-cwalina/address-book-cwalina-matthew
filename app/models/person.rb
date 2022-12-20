class Person < ApplicationRecord
  has_many :emails
  has_many :phone_numbers
  has_many :addresses
  validates :first_name, :last_name, presence: true
end
