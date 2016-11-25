class CreateSalesProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :sales_products do |t|
      t.references :sale, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
