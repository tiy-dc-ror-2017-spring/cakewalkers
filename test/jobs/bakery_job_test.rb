require "test_helper"

class BakeryJobTest < ActiveSupport::TestCase
  test "get response from bakery api" do
    order = Order.create
    order.line_items.create(quantity: 2, product: products(:one))
    response = BakeryJob.new.perform(order)
    assert response
  end
end
