class AddUsedToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :used, :boolean
  end
end
