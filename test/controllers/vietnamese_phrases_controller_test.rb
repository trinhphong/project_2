require 'test_helper'

class VietnamesePhrasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vietnamese_phrase = vietnamese_phrases(:one)
  end

  test "should get index" do
    get vietnamese_phrases_url
    assert_response :success
  end

  test "should get new" do
    get new_vietnamese_phrase_url
    assert_response :success
  end

  test "should create vietnamese_phrase" do
    assert_difference('VietnamesePhrase.count') do
      post vietnamese_phrases_url, params: { vietnamese_phrase: {  } }
    end

    assert_redirected_to vietnamese_phrase_url(VietnamesePhrase.last)
  end

  test "should show vietnamese_phrase" do
    get vietnamese_phrase_url(@vietnamese_phrase)
    assert_response :success
  end

  test "should get edit" do
    get edit_vietnamese_phrase_url(@vietnamese_phrase)
    assert_response :success
  end

  test "should update vietnamese_phrase" do
    patch vietnamese_phrase_url(@vietnamese_phrase), params: { vietnamese_phrase: {  } }
    assert_redirected_to vietnamese_phrase_url(@vietnamese_phrase)
  end

  test "should destroy vietnamese_phrase" do
    assert_difference('VietnamesePhrase.count', -1) do
      delete vietnamese_phrase_url(@vietnamese_phrase)
    end

    assert_redirected_to vietnamese_phrases_url
  end
end
