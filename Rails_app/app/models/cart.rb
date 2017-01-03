class Cart < ApplicationRecord
  belongs_to :customer
  
  acts_as_shopping_cart_using :cart_item

  def add_item(product_id, quantity)
    @product = Product.find(product_id)
    if !@product.nil?
      self.add(@product, @product.price, quantity)
      save
    end
  end

  def remove_item(product_id, quantity)
    @product = Product.find(product_id)
    if !@product.nil?
      self.remove(@product, quantity)
      save
    end
  end
end
