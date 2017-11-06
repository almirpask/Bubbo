require 'test_helper'

class Backoffice::SubjectControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_subject_index_url
    assert_response :success
  end

end
