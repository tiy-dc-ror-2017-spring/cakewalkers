class Address < ApplicationRecord
  belongs_to :user
  validates :first_name, length: { minimum: 1 }
  validates :last_name, length: { minimum: 1 }
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true

  VALID_ZIPCODE_REGEX = /\A(^\d{5}(?:[-\s]\d{4})?$)\Z/i
  validates :zipcode, presence: true, format: { with: VALID_ZIPCODE_REGEX }
end
