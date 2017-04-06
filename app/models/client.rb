class Client < ApplicationRecord
  belongs_to :user
  VALID_NAME_REGEX = /^[a-z-A-Z]+$/i
  validates :first_name, format: { with: VALID_NAME_REGEX }
  validates :last_name, format: { with: VALID_NAME_REGEX }

  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true

  VALID_ZIPCODE_REGEX = /\A(^\d{5}(?:[-\s]\d{4})?$)\Z/i
  validates :zipcode, presence: true, format: { with: VALID_ZIPCODE_REGEX }
end
