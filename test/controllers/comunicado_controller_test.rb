require "test_helper"

class ComunicadoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get comunicado_index_url
    assert_response :success
  end
end
