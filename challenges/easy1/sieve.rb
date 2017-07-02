class Sieve
  def initialize(n)
    @nums = (2..n).to_a
  end

  def primes
    return [] if @nums.empty?

    prime = @nums.first
    sift_out_multiples_of prime
    [prime] + primes
  end

  private

  def sift_out_multiples_of(n)
    @nums.delete_if { |num| (num % n).zero? }
  end
end
