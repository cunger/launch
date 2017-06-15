class TextAnalyzer
  def process(file)
    yield File.read(file)
  end
end

# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TextAnalyzerTest < Minitest::Test

  def setup
    @analyzer = TextAnalyzer.new
  end

  def test_paragraphs
    assert_output(/\d+ paragraphs/) do
      @analyzer.process('example1.txt') do |text|
        puts "#{text.lines("\n\n").size} paragraphs"
      end
    end
  end

  def test_lines
    assert_output(/\d+ lines/) do
      @analyzer.process('example1.txt') do |text|
        puts "#{text.lines.size} lines"
      end
    end
  end

  def test_words
    assert_output(/\d+ words/) do
      @analyzer.process('example1.txt') do |text|
        puts "#{text.split(/\s+/).size} words"
      end
    end
  end

  def test_multiple_puts
    assert_output(/\d+ paragraphs\n\d+ lines\n\d+ words\n/) do
      puts '8 paragraphs'
      puts '18 lines'
      puts '406 words'
    end
  end
end
