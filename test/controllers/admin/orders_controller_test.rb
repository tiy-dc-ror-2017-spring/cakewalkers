require "test_helper"

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    Order.create
    get admin_orders_url
    assert_response :success
  end

  test "should get show" do
    order = Order.create
    get admin_orders_url(order)
    assert_response :success
  end
end
