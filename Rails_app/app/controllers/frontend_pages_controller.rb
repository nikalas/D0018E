class FrontendPagesController < ApplicationController
  def index
	  @products = Product.all
  end

  def product
    @product = Product.find(params[:id])
  end

  def user
	  @user = Customer.find(params[:id])
  end

  def order
  end

  def customer_cart
  end

  def sing_up
	  @user = Customer.new
  end

  def sign_in
  end
end
