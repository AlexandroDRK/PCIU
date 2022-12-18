require "test_helper"

class CursoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get curso_index_url
    assert_response :success
  end

  test "should get show" do
    get curso_show_url
    assert_response :success
  end
end
