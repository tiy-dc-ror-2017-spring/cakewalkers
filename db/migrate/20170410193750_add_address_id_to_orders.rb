class AddAddressIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :address_id
  end
end
