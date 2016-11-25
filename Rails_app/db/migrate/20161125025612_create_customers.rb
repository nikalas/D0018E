class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :p_nr
      t.string :adress
      t.integer :zip
      t.string :city
      t.string :email
      t.string :phone_nr
      t.string :password
      t.string :picture

      t.timestamps
    end
  end
end
