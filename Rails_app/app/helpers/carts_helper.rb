module CartsHelper
  def current_cart
    if Cart.exists?(id: session[:cart_id])
      @current_cart ||= Cart.find(session[:cart_id])
    else
      if logged_in?
        if Cart.where(customer_id: session[:customer_id]).blank?
            @current_cart = Cart.where(customer_id: session[:customer_id]
                                      ).order("created_at, DESC").first
        else
          @current_cart = Cart.create!
          @current_cart.customer_id = sessioni[:customer_id]
        end
      else
        @current_cart = Cart.create!
      end
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end 
end
