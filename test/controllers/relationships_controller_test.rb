require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get show_follow" do
    get relationships_show_follow_url
    assert_response :success
  end

  test "should get show_follower" do
    get relationships_show_follower_url
    assert_response :success
  end

end
