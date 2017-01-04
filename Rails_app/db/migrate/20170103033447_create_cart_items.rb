class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.shopping_cart_item_fields # Creates the cart items fields for acts_as_shopping_cart
    end
  end
end
