module SessionsHelper
  def log_in(customer)
    session[:customer_id] = customer.id
  end

  def log_out
    session.delete(:user_id)
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
