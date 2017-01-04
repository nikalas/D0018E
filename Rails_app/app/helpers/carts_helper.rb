module CartsHelper
  def current_cart
    if Cart.exists?(session[:cart_id])
      @current_cart ||= Cart.find(session[:cart_id])
    else
      if logged_in?
          if Cart.where(customer_id: session[:customer_id]).exists?
            @current_cart = Cart.where(customer_id: session[:customer_id]
                                      ).last
        else
          @current_cart = Cart.create(customer_id: session[:customer_id])
        end
      else
        @current_cart = Cart.create!
      end
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end 
end
