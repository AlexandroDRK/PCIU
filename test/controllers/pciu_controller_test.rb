require "test_helper"

class PciuControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pciu_home_url
    assert_response :success
  end
end
