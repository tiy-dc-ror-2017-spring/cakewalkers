class ChangeUnitPriceToUnitPriceInCents < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :unit_price, :unit_price_in_cents
  end
end
