require "test_helper"

class IntroControllerTest < ActionDispatch::IntegrationTest
  test "should get upload" do
    get intro_upload_url
    assert_response :success
  end
end
