require "test_helper"

class BakeryJobTest < ActiveSupport::TestCase
  test "get response from bakery api" do
    order = Order.create
    order.line_items.create(quantity: 2, product: products(:one))
    order.line_items.create(quantity: 2, product: products(:two))
    response = BakeryJob.new.perform(order)
    assert_equal 2, response.length
  end
end
