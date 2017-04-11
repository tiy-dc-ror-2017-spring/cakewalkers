class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :staff_member, optional: true
  has_many :line_items
  belongs_to :address, optional: true
  scope :ready, -> { where("ready_at IS NOT NULL") }

  def calculate_subtotal(line_items)
    total = 0
    line_items.each do |item|
      total += item.line_item_total
    end
    total
  end

  def dc_tax
    0.0575
  end

  def finalize
    self.subtotal = self.calculate_subtotal(self.line_items)
    self.tax = self.dc_tax
    self.total = (self.subtotal * self.dc_tax) + self.subtotal
    self.save
  end

  def claimed?
    picked_up_at && staff_member
  end

  def out_for_delivery?
    claimed? && !delivered_at
  end
end
