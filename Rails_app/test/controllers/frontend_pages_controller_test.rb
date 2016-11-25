require 'test_helper'

class FrontendPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get frontend_pages_index_url
    assert_response :success
  end

  test "should get product" do
    get frontend_pages_product_url
    assert_response :success
  end

  test "should get user" do
    get frontend_pages_user_url
    assert_response :success
  end

  test "should get order" do
    get frontend_pages_order_url
    assert_response :success
  end

  test "should get customer_cart" do
    get frontend_pages_customer_cart_url
    assert_response :success
  end

  test "should get sing_up" do
    get frontend_pages_sing_up_url
    assert_response :success
  end

  test "should get sign_in" do
    get frontend_pages_sign_in_url
    assert_response :success
  end

end
