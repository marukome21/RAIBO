require "test_helper"

class Admin::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get posts" do
    get admin_homes_posts_url
    assert_response :success
  end

  test "should get users" do
    get admin_homes_users_url
    assert_response :success
  end

  test "should get comments" do
    get admin_homes_comments_url
    assert_response :success
  end
end
