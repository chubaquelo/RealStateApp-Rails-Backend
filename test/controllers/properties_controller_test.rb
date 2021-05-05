require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get properties_index_url
    assert_response :success
  end

  test "should get create" do
    get properties_create_url
    assert_response :success
  end

  test "should get update" do
    get properties_update_url
    assert_response :success
  end

  test "should get destroy" do
    get properties_destroy_url
    assert_response :success
  end
end
