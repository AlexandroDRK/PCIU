require "test_helper"

class ComentarioControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get comentario_index_url
    assert_response :success
  end

  test "should get new" do
    get comentario_new_url
    assert_response :success
  end

  test "should get create" do
    get comentario_create_url
    assert_response :success
  end
end
