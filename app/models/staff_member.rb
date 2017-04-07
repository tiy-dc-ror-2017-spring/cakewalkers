class StaffMember < ApplicationRecord
  belongs_to :user

  # def email
  #   user.email
  # end
  delegate :email, to: :user
  # def email=(new_email)
  #   user.email = new_email
  # end
  delegate :email=, to: :user
  # def password=(new_password)
  #   user.password = new_password
  # end
  delegate :password=, to: :user
  # def password_confirmation=(new_password)
  #   user.password_confirmation = new_password
  # end
  delegate :password_confirmation=, to: :user
end
