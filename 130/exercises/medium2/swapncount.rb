class Text
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TextTest < Minitest::Test
  def setup
    @doc = Text.new File.read('../medium1/ipsum.txt')
  end

  def test_swap
    count_a = @doc.text.count('a')
    count_e = @doc.text.count('e')

    swapped_text = @doc.swap('a', 'e')

    assert_equal 0, swapped_text.count('a')
    assert_equal count_a, swapped_text.count('e') - count_e
  end

  def test_count
    assert_equal 406, @doc.word_count 
  end
end
