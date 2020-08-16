require 'test_helper'

class ViewersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get viewers_index_url
    assert_response :success
  end

  test "should get show" do
    get viewers_show_url
    assert_response :success
  end

  test "should get new" do
    get viewers_new_url
    assert_response :success
  end

  test "should get edit" do
    get viewers_edit_url
    assert_response :success
  end

end
