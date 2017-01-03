module DeliveriesHelper
  def check_stock
    current_cart.shopping_cart_items.each do |item|
      if item.quantity > Product.find(item.item_id).stock
        return false
      end
    end
    return true
  end
end
