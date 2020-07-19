require "application_system_test_case"

class PanjabiWordsTest < ApplicationSystemTestCase
  setup do
    @panjabi_word = panjabi_words(:one)
  end

  test "visiting the index" do
    visit panjabi_words_url
    assert_selector "h1", text: "Panjabi Words"
  end

  test "creating a Panjabi word" do
    visit panjabi_words_url
    click_on "New Panjabi Word"

    fill_in "Anuvaad", with: @panjabi_word.anuvaad
    check "Approved" if @panjabi_word.approved
    fill_in "Gurmukhi", with: @panjabi_word.gurmukhi
    fill_in "Phonetics", with: @panjabi_word.phonetics
    fill_in "Pos", with: @panjabi_word.pos
    fill_in "Roman", with: @panjabi_word.roman
    fill_in "Score", with: @panjabi_word.score
    fill_in "Shahmukhi", with: @panjabi_word.shahmukhi
    fill_in "Usage", with: @panjabi_word.usage
    click_on "Create Panjabi word"

    assert_text "Panjabi word was successfully created"
    click_on "Back"
  end

  test "updating a Panjabi word" do
    visit panjabi_words_url
    click_on "Edit", match: :first

    fill_in "Anuvaad", with: @panjabi_word.anuvaad
    check "Approved" if @panjabi_word.approved
    fill_in "Gurmukhi", with: @panjabi_word.gurmukhi
    fill_in "Phonetics", with: @panjabi_word.phonetics
    fill_in "Pos", with: @panjabi_word.pos
    fill_in "Roman", with: @panjabi_word.roman
    fill_in "Score", with: @panjabi_word.score
    fill_in "Shahmukhi", with: @panjabi_word.shahmukhi
    fill_in "Usage", with: @panjabi_word.usage
    click_on "Update Panjabi word"

    assert_text "Panjabi word was successfully updated"
    click_on "Back"
  end

  test "destroying a Panjabi word" do
    visit panjabi_words_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Panjabi word was successfully destroyed"
  end
end
