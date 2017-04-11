class Product < ApplicationRecord
  has_many :line_items

  def unit_price
    if unit_price_in_cents
      unit_price_in_cents / 100
    end
  end
end
