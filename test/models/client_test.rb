require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "Client exists" do
    assert Client
  end

  test "Client has address" do
    client = clients(:robby)
    assert client.zip, "20050"
  end
end
