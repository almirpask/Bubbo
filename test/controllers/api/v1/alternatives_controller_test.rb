require 'test_helper'

class Api::V1::AlternativesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_alternatives_create_url
    assert_response :success
  end

end
