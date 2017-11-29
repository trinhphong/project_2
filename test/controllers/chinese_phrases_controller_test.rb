require 'test_helper'

class ChinesePhrasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chinese_phrase = chinese_phrases(:one)
  end

  test "should get index" do
    get chinese_phrases_url
    assert_response :success
  end

  test "should get new" do
    get new_chinese_phrase_url
    assert_response :success
  end

  test "should create chinese_phrase" do
    assert_difference('ChinesePhrase.count') do
      post chinese_phrases_url, params: { chinese_phrase: { content: @chinese_phrase.content } }
    end

    assert_redirected_to chinese_phrase_url(ChinesePhrase.last)
  end

  test "should show chinese_phrase" do
    get chinese_phrase_url(@chinese_phrase)
    assert_response :success
  end

  test "should get edit" do
    get edit_chinese_phrase_url(@chinese_phrase)
    assert_response :success
  end

  test "should update chinese_phrase" do
    patch chinese_phrase_url(@chinese_phrase), params: { chinese_phrase: { content: @chinese_phrase.content } }
    assert_redirected_to chinese_phrase_url(@chinese_phrase)
  end

  test "should destroy chinese_phrase" do
    assert_difference('ChinesePhrase.count', -1) do
      delete chinese_phrase_url(@chinese_phrase)
    end

    assert_redirected_to chinese_phrases_url
  end
end
