require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user exists" do
    assert User
  end

  test "user has password" do
    client = users(:client)
    assert_equal "cc3a0280e4fc1415930899896574e118", client.password_digest
  end
end
