class FrontendPagesController < ApplicationController
  def index

	  # These two rows are for selecting what products to render
	  # in the product grid.
	  number_of_products = 6
    @products_to_render = Product.limit(number_of_products).order("RANDOM()")
  end

  def product
    @product = Product.find(params[:id])

    # This selects all ratings where the review is not null or an empty string
    # It needs to check for empty strings as well since that is what rails inserts
    # on creation if you leave the field empty.
    @rating  = Rating.where(product: @product.id).where.not(review: [nil, ''])

    @products = Product.all
    number_of_products = 3
    @products_to_render = @products.limit(number_of_products).order("RANDOM()")
  end

  def category
    @category = Category.find(params[:id])

    @category_ids = Category.where(parent: @category.id).or(
                    Category.where(id: params[:id])).to_a{|c| c.id}
    @products_to_render = Product.where(category: @category_ids)
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
