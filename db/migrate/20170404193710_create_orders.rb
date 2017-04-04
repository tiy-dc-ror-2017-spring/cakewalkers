class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.integer :staff_id
      t.integer :subtotal
      t.integer :tax
      t.integer :total
      t.datetime :picked_up_at
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
