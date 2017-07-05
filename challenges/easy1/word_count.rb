class Phrase
  def initialize(string)
    @words = string.downcase.scan /\b[\w']+\b/
  end

  def word_count
    counts = {}
    @words.each do |word|
      counts[word] ||= @words.count(word)
    end
    counts

    # Alternative (iterating over @words only once):

    # counts = Hash.new(0)
    # @words.each { |word| counts[word] += 1 }
    # counts

    # Or:
    # @words.each_with_object(Hash.new(0)) do |word, counts|
    #   counts[word] += 1
    # end
  end
end
