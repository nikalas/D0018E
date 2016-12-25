class FrontendPagesController < ApplicationController
  def index

	  # These two rows are for selecting what products to render
	  # in the product grid.
	  number_of_products = 6
    @products_to_render = Product.limit(number_of_products).order("RANDOM()")
  end

  def product
    @product = Product.find(params[:id])
  end

  def category
    @category = Category.find(params[:id])
    @products_to_render = Product.where(category_id: @category.id)
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
