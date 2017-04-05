class ChangeUnitPriceToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :unit_price, :integer
  end
end
