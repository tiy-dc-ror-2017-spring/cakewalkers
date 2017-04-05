require "rails_helper"

RSpec.describe LineItem, type: :model do

  it "exists" do
    assert LineItem
  end

  it "belongs_to order" do
    # TODO: create test when all models have been generated
    # order = Order.create!()
    # LineItem.create!(order_id: order.id)
    # expect(order.line_item.length).to eq 1
  end
end
