class SetDefaultsInDeliveries < ActiveRecord::Migration[5.0]
  def change
    change_column :carts, :used, :boolean, :default => false
    change_column :deliveries, :shipped, :boolean, :default => false
    change_column :deliveries, :payed, :boolean, :default => false
  end
end
