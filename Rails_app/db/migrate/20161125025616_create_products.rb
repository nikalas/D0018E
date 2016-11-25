class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.references :category, foreign_key: true
      t.float :price
      t.integer :stock

      t.timestamps
    end
  end
end
