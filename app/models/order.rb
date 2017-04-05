class Order < ApplicationRecord
  belongs_to :client
  belongs_to :staff
  has_many :line_items
  validates :total, presence: true
  validates :subtotal, presence: true
  validates :tax, presence: true

  # TODO: write code to grab line_item_total for each line_item to get subtotal for order
  def calculate_subtotal(line_items)
  end

  def calculate_tax_total(subtotal)
    subtotal * 0.00575
  end
end
