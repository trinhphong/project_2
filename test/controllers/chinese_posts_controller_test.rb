require 'test_helper'

class ChinesePostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chinese_post = chinese_posts(:one)
  end

  test "should get index" do
    get chinese_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_chinese_post_url
    assert_response :success
  end

  test "should create chinese_post" do
    assert_difference('ChinesePost.count') do
      post chinese_posts_url, params: { chinese_post: { string: @chinese_post.string, string: @chinese_post.string, text: @chinese_post.text } }
    end

    assert_redirected_to chinese_post_url(ChinesePost.last)
  end

  test "should show chinese_post" do
    get chinese_post_url(@chinese_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_chinese_post_url(@chinese_post)
    assert_response :success
  end

  test "should update chinese_post" do
    patch chinese_post_url(@chinese_post), params: { chinese_post: { string: @chinese_post.string, string: @chinese_post.string, text: @chinese_post.text } }
    assert_redirected_to chinese_post_url(@chinese_post)
  end

  test "should destroy chinese_post" do
    assert_difference('ChinesePost.count', -1) do
      delete chinese_post_url(@chinese_post)
    end

    assert_redirected_to chinese_posts_url
  end
end
