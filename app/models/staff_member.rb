class StaffMember < ApplicationRecord
  belongs_to :user

  delegate :email, to: :user
  delegate :email=, to: :user
  delegate :password=, to: :user
  delegate :password_confirmation=, to: :user
end
