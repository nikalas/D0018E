module SessionsHelper
  def log_in(customer)
    session[:customer_id] = customer.id
    
    # If there is a active cart then claim it
    if session[:cart_id] && Cart.exists?(id: session[:cart_id])
      cart = Cart.find(session[:cart_id])
      cart.customer_id = session[:customer_id]
      cart.save
    end
  end

  def log_out
    session.delete(:customer_id)
    @current_user = nil
  end

  def current_user
    @current_user ||= Customer.find_by(id: session[:customer_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def is_admin?
    #TODO check for admin privileges
  end

  def is_warehouse_worker?
    #TODO check for privileges
  end
end
