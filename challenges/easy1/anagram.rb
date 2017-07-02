class Anagram
  def initialize(string)
    @string = string
    @chars  = sorted_chars(string)
  end

  def match(words)
    words.select { |word|
      word.downcase != @string.downcase &&
      sorted_chars(word) == @chars
    }
  end

  private

  def sorted_chars(string)
    string.downcase.chars.sort
  end
end
