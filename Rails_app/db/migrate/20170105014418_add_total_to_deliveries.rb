class AddTotalToDeliveries < ActiveRecord::Migration[5.0]
  def change
    add_column :deliveries, :total, :float
  end
end
