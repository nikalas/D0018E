require 'test_helper'

class FrontendPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Patches-N-stuff"
  end

  test "should get index" do
    get frontend_pages_index_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get product" do
    get frontend_pages_product_url
    assert_response :success
    assert_select "title", "Produkter | #{@base_title}"
  end

  test "should get user" do
    get frontend_pages_user_url
    assert_response :success
    assert_select "title", "Användare | #{@base_title}"
  end

  test "should get order" do
    get frontend_pages_order_url
    assert_response :success
    assert_select "title", "Order | #{@base_title}"
  end

  test "should get customer_cart" do
    get frontend_pages_customer_cart_url
    assert_response :success
    assert_select "title", "Kundkorg | #{@base_title}"
  end

  test "should get sing_up" do
    get frontend_pages_sing_up_url
    assert_response :success
    assert_select "title", "registrera | #{@base_title}"
  end

  test "should get sign_in" do
    get frontend_pages_sign_in_url
    assert_response :success
    assert_select "title", "Sign in | #{@base_title}"
  end

end
