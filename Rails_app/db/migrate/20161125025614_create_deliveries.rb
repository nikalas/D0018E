class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.references :customer, foreign_key: true
      t.references :cart, foreign_key: true
      t.string :adress
      t.integer :zip
      t.string :city
      t.boolean :payed
      t.boolean :shipped
      t.boolean :order_date

      t.timestamps
    end
  end
end
