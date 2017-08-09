class Crypto
  attr_reader :ciphertext

  def initialize(text)
    @plaintext  = text
    @ciphertext = encode(normalize_plaintext)
  end

  def normalize_plaintext
    @plaintext.downcase.gsub(/[^\p{Alnum}]/, '')
  end

  def size
    Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).map(&:join)
  end

  def normalize_ciphertext
    encode(normalize_plaintext, ' ')
  end

  def encode(text, delimiter='')
    str = ''
    (0..size).each do |i|
      str += plaintext_segments.map { |s| s.chars.fetch(i, '') }.join
      str += delimiter
    end
    str.strip
  end
end
