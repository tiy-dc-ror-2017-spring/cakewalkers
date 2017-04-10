class AddReadyAtToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :ready_at, :datetime
  end
end
