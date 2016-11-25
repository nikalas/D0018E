class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :picture

      t.timestamps
    end
  end
end
