class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def total_price
    self.line_item_total = self.quantity * self.product.unit_price_in_cents
    self.save
  end
end
