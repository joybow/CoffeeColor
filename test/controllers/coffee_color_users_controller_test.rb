require "test_helper"

class CoffeeColorUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get coffee_color_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get coffee_color_users_update_url
    assert_response :success
  end

  test "should get mypage" do
    get coffee_color_users_mypage_url
    assert_response :success
  end
end
