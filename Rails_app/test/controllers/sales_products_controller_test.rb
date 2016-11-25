require 'test_helper'

class SalesProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_product = sales_products(:one)
  end

  test "should get index" do
    get sales_products_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_product_url
    assert_response :success
  end

  test "should create sales_product" do
    assert_difference('SalesProduct.count') do
      post sales_products_url, params: { sales_product: { product_id: @sales_product.product_id, sale_id: @sales_product.sale_id } }
    end

    assert_redirected_to sales_product_url(SalesProduct.last)
  end

  test "should show sales_product" do
    get sales_product_url(@sales_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_product_url(@sales_product)
    assert_response :success
  end

  test "should update sales_product" do
    patch sales_product_url(@sales_product), params: { sales_product: { product_id: @sales_product.product_id, sale_id: @sales_product.sale_id } }
    assert_redirected_to sales_product_url(@sales_product)
  end

  test "should destroy sales_product" do
    assert_difference('SalesProduct.count', -1) do
      delete sales_product_url(@sales_product)
    end

    assert_redirected_to sales_products_url
  end
end
