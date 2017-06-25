class Series
  def initialize(string)
    @digits = string.chars.map(&:to_i)
  end

  def slices(n)
     raise ArgumentError if n > @digits.length

     slices = []
     0.upto(@digits.length - n) do |start|
       slices << @digits[start, n]
     end
     slices

     # Shorter, using Enumerable#each_cons: 
     # @digits.each_cons(n).to_a
  end
end
