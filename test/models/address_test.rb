require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "Address exists" do
    assert Address
  end

  test "Address has address" do
    address = addresses(:robby)
    assert address.zip, "20050"
  end
end
