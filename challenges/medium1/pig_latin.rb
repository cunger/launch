class PigLatin
  class << self
    def translate(phrase)
      phrase.split(' ')
            .map { |word| garble word }
            .join(' ')
    end

    private

    def garble(word)
      # Special case: word starts with x or y followed by a consonant
      return word + 'ay' if word =~ /\A(x|y)[^aeiou].*\z/
      # General case: move everything before the first vowel to the end
      # of the word and append 'ay'
      word.sub(/\A([^aeiou]?qu|[^aeiou]*)([aeiou]+.*)\z/, '\2\1ay')
    end
  end
end
