class Person < ApplicationRecord
  has_many :emails, dependent: :destroy
  has_many :phone_numbers, dependent: :destroy
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true
  accepts_nested_attributes_for :emails, allow_destroy: true
end
