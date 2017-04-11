require "test_helper"

class Admin::HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_admin
  end
  test "should get index" do
    get admin_home_url
    assert_response :success
  end
end
