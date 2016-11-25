require 'test_helper'

class BackendPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backend_pages_index_url
    assert_response :success
  end

end
