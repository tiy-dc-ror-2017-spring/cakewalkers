require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user exists" do
    assert User
  end

  test "user is an admin" do
    admin = users(:admin)
    assert admin.admin?
  end

  test "user is a staff_member" do
    staff = users(:staff)
    assert staff.staff_member?
  end

  test "user is a client" do
    client = users(:client)
    assert client.client?
  end
end
