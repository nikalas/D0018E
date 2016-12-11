require 'test_helper'

class BackendPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Patches-N-Stuff"
  end

  test "should get index" do
    get backend_pages_index_url
    assert_response :success
    assert_select "title", "Admin | #{@base_title}"
  end

end
