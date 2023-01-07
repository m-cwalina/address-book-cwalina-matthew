class Address < ApplicationRecord
  belongs_to :person
  validates :street, :town, :zip_code, presence: true
end
