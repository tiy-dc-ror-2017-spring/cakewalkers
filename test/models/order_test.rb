require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "when Order exists" do
    assert Order
  end

  test "response from bakery if order is done" do
    orders_for_delivery = Order.completed_orders
    assert_equal 4, orders_for_delivery.length
  end
end
