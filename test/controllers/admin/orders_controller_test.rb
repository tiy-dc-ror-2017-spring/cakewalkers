require "test_helper"

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  # Import number_to_currency helpers
  # Allows for selecting output currency text in assert_select
  include ActionView::Helpers::NumberHelper

  setup do
    login_admin
  end

  test "should get index" do
    get admin_orders_url
    assert_response :success
    assert_select "tr>td", text: number_to_currency(100)
  end

  test "should get show" do
    get admin_order_url(orders(:client_one_order_ready))
    assert_response :success
  end
end
