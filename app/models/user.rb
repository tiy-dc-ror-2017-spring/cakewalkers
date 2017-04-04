class User < ApplicationRecord
  validates :password, confirmation: true
  validates :password_confrimation, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

end
