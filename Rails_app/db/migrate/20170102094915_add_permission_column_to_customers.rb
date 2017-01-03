class AddPermissionColumnToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :permission, :integer, :default => 1
  end
end
