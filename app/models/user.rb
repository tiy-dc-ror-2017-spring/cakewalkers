class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  has_one :staff_member
  has_many :orders

  def unpaid_order
    if self.orders.where(paid_at: nil).empty?
      self.orders.create
    else
      self.orders.find_by(paid_at: nil)
    end
  end

  def add_to_cart(item_params)
    self.unpaid_order.line_items.build(item_params)
  end
end
