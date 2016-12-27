class AddpriceModToSalesProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :Sales_products, :price_mod, :decimal
  end
end
