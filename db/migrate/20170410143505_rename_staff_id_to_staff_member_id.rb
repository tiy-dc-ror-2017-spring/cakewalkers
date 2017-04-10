class RenameStaffIdToStaffMemberId < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :staff_id, :staff_member_id
  end
end
