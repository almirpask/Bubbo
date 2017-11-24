require 'test_helper'

class Api::V1::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_home_index_url
    assert_response :success
  end

end
