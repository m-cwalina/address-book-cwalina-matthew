class Person < ApplicationRecord
  has_many :emails
  has_many :phone_numbers
  has_many :addresses
  validates :first_name, :last_name, presence: true
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :phone_numbers
  accepts_nested_attributes_for :emails
end
