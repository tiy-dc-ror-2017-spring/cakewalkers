require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user exists" do
    assert User
  end

  test "user has password" do
    client = users(:client)
    assert_equal "cc3a0280e4fc1415930899896574e118", client.password_digest
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
