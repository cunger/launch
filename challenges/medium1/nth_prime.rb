class Prime

  # Brute force solution

  class << self
    def nth(n)
      raise ArgumentError if n < 1
      primes.first(n).last
    end

    private

    def primes
      Enumerator.new do |yielder|
        n = 2
        loop do
          yielder << n
          begin n += 1 end until is_prime?(n)
        end
      end
    end

    def is_prime?(num)
      (2...num).none? { |divisor| (num % divisor).zero? }
    end
  end
end
