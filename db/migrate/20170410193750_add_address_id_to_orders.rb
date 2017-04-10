class AddAddressIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :address
  end
end
