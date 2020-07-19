require 'test_helper'

class PanjabiWordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @panjabi_word = panjabi_words(:one)
  end

  test "should get index" do
    get panjabi_words_url
    assert_response :success
  end

  test "should get new" do
    get new_panjabi_word_url
    assert_response :success
  end

  test "should create panjabi_word" do
    assert_difference('PanjabiWord.count') do
      post panjabi_words_url, params: { panjabi_word: { anuvaad: @panjabi_word.anuvaad, approved: @panjabi_word.approved, gurmukhi: @panjabi_word.gurmukhi, phonetics: @panjabi_word.phonetics, pos: @panjabi_word.pos, roman: @panjabi_word.roman, score: @panjabi_word.score, shahmukhi: @panjabi_word.shahmukhi, usage: @panjabi_word.usage } }
    end

    assert_redirected_to panjabi_word_url(PanjabiWord.last)
  end

  test "should show panjabi_word" do
    get panjabi_word_url(@panjabi_word)
    assert_response :success
  end

  test "should get edit" do
    get edit_panjabi_word_url(@panjabi_word)
    assert_response :success
  end

  test "should update panjabi_word" do
    patch panjabi_word_url(@panjabi_word), params: { panjabi_word: { anuvaad: @panjabi_word.anuvaad, approved: @panjabi_word.approved, gurmukhi: @panjabi_word.gurmukhi, phonetics: @panjabi_word.phonetics, pos: @panjabi_word.pos, roman: @panjabi_word.roman, score: @panjabi_word.score, shahmukhi: @panjabi_word.shahmukhi, usage: @panjabi_word.usage } }
    assert_redirected_to panjabi_word_url(@panjabi_word)
  end

  test "should destroy panjabi_word" do
    assert_difference('PanjabiWord.count', -1) do
      delete panjabi_word_url(@panjabi_word)
    end

    assert_redirected_to panjabi_words_url
  end
end
