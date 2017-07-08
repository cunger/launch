require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'odd_words'

class OddWordsTest < Minitest::Test

  def test_empty_text
    assert_equal('', process(''))
    assert_equal('', process_char_by_char(''))
  end

  def test_one_word_text
    assert_equal('word', process('word'))
    assert_equal('word', process_char_by_char('word'))
  end

  def test_text_without_period
    assert_equal('hello dlrow', process('hello world'))
    assert_equal('hello dlrow', process_char_by_char('hello world'))
  end

  def test_text_with_spaces_in_the_end
    assert_equal('hello dlrow', process('hello world   '))
    assert_equal('hello dlrow', process_char_by_char('hello world   '))
  end

  def test_one_word_text_with_period
    assert_equal('word.', process('word.'))
    assert_equal('word.', process_char_by_char('word.'))
  end

  def test_spaces_before_period
    assert_equal('word.', process('word  .'))
    assert_equal('word.', process_char_by_char('word  .'))
  end

  def test_example
    assert_equal('whats eht matter htiw kansas.', process('whats the matter with kansas.'))
    assert_equal('whats eht matter htiw kansas.', process_char_by_char('whats the matter with kansas.'))
  end

  def test_multiple_spaces
    assert_equal('whats eht matter htiw kansas.', process('whats     the  matter       with      kansas.'))
    assert_equal('whats eht matter htiw kansas.', process_char_by_char('whats     the  matter       with      kansas.'))
  end
end
