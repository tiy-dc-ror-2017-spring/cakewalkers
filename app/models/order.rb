class Order < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :staff, optional: true
  has_many :line_items

  # TODO: write code to grab line_item_total for each line_item to get subtotal for order
  def calculate_subtotal(line_items)
  end

  def calculate_tax(subtotal)
    subtotal * 0.00575
  end
end
