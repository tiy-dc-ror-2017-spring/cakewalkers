class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  has_one :staff_member
  has_many :orders
  has_many :addresses

  def unpaid_order
    if orders.where(paid_at: nil).empty?
      orders.create
    else
      orders.find_by(paid_at: nil)
    end
  end

  def add_to_cart(item_params)
    unpaid_order.line_items.build(item_params)
  end

  def admin?
    role == "admin"
  end

  def staff_member?
    role == "staff_member"
  end

  def client?
    role != "admin" && role != "staff_member"
    # !%w(admin staff_member).include?(role)
  end
end
