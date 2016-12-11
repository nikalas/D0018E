require 'test_helper'

class FrontendPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Patches-N-stuff"
  end

  test "should get index" do
    get '/index'
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get product" do
    get '/product'
    assert_response :success
    assert_select "title", "Produkter | #{@base_title}"
  end

  test "should get user" do
    get '/user'
    assert_response :success
    assert_select "title", "Användare | #{@base_title}"
  end

  test "should get order" do
    get '/order'
    assert_response :success
    assert_select "title", "Order | #{@base_title}"
  end

  test "should get customer_cart" do
    get '/cart'
    assert_response :success
    assert_select "title", "Kundkorg | #{@base_title}"
  end

  test "should get sing_up" do
    get '/sign_up'
    assert_response :success
    assert_select "title", "registrera | #{@base_title}"
  end

  test "should get sign_in" do
    get '/sign_in'
    assert_response :success
    assert_select "title", "Sign in | #{@base_title}"
  end

end
