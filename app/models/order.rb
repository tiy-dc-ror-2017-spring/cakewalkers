class Order < ApplicationRecord
  belongs_to :client
  belongs_to :staff
  has_many :line_items
end
