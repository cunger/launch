module PerfectNumber

  def self.classify(num)
    raise RuntimeError if num.negative?

    factors = (1...num).select { |n| (num % n).zero? }

    case factors.sum <=> num
    when  0 then 'perfect'
    when  1 then 'abundant'
    when -1 then 'deficient'
    end
  end
end
