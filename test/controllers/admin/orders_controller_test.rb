require 'test_helper'

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_orders_url
    assert_response :success
  end

  test "should get show" do
    get admin_order_url(Order.create)
    assert_response :success
  end
end
