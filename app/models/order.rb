class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :staff_member, optional: true
  has_many :line_items
  scope :ready, -> { where("ready_at IS NOT NULL") }

  # TODO: write code to grab line_item_total for each line_item to get subtotal for order
  def calculate_subtotal(line_items)
  end

  def calculate_tax_total(subtotal)
    subtotal * 0.00575
  end

  def claimed?
    picked_up_at && staff_member
  end

  def out_for_delivery?
    claimed? && !delivered_at
  end

  def send_order_to_bakery
    BakeryJob.perform_later(self)
  end

  def completed_orders
    response = HTTParty.get("https://cakewalkers-api.herokuapp.com/bake_jobs")
    @completed_orders = response.select { |order| order.state = "done" }
  end
end
