class UsedDefaultFalseInCarts < ActiveRecord::Migration[5.0]
  def change
    change_column :carts, :used, :boolean, :default => 0
  end
end
