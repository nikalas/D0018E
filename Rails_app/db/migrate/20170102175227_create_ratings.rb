class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :product, foreign_key: true
      t.references :customer, foreign_key: true
      t.integer :grade
      t.string :review

      t.timestamps
    end
  end
end
