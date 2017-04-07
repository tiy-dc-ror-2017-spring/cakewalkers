require 'test_helper'

class Admin::StaffMembersControllerTest < ActionDispatch::IntegrationTest
  test "index_success" do
    get admin_staff_members_path
    assert_response :success
  end
end
