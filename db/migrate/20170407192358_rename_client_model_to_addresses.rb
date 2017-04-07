class RenameClientModelToAddresses < ActiveRecord::Migration[5.0]
  def change
    rename_table :clients, :addresses
  end
end
