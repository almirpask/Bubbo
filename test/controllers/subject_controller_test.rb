require 'test_helper'

class SubjectControllerTest < ActionDispatch::IntegrationTest
  test "should get backoffice::index" do
    get subject_backoffice::index_url
    assert_response :success
  end

end
