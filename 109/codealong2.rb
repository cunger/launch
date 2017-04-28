
VOWELS = %w(a e i o u)

def remove_vowels(strings)
  strings.map do |string|
    string.chars.reject { |char| VOWELS.include? char }.join
    # string.delete("aeiuo")
  end
end

p remove_vowels(%w(green yellow black white))
p remove_vowels(%w(green yellow black white)) == %w(grn yllw blck wht)

###

def balancer(string)
  # string.count('(') == string.count(')')
  stack = []
  string.each_char do |char|
    case char
    when '(' then stack.push('(')
    when ')' then stack.pop
    end
  end
  stack.empty?
end

p balancer('hi') == true
p balancer('(hi') == false
p balancer('(hi)') == true
p balancer('((h)i)') == true
p balancer('((h)i') == false
p balancer(')(') == false
p balancer(')') == false

###

def find_primes(n1, n2)
  # (n1..n2).each do |num|
  #   p num if prime?(num)
  # end
  p (n1..n2).select { |n| prime?(n) }
end

def prime?(num)
  # (2...num).select { |n| (num % n).zero? }.empty?
  (2...num).each do |n|
    return false if (num % n).zero?
  end
  true
end

find_primes(3, 10)
