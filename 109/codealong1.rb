def reverse1(str)
  reversed_str = ""
  str.each_char do |char|
    reversed_str = char + reversed_str
  end
  reversed_str
end

p reverse1("") == ""
p reverse1("fnord!") == "!dronf"

def reverse2(str)
  chars = str.chars
  reversed_chars = []
  until chars.empty?
    reversed_chars << chars.pop
  end
  reversed_chars.join
end

p reverse2("") == ""
p reverse2("fnord!") == "!dronf"

# -----------------------------------

def divisible_by?(num, divisor)
  return false if divisor.zero?
  (num % divisor).zero?
end

def fizzbuzz(start_num, end_num)
  output = []
  (start_num..end_num).each do |num|
    fizz = divisible_by?(num, 3)
    buzz = divisible_by?(num, 5)
    if fizz && buzz
      output << '"FizzBuzz"'
    elsif fizz
      output << '"Fizz"'
    elsif buzz
      output << '"Buzz"'
    else
      output << num
    end
  end
  puts output.join(', ')
end

p divisible_by?(15, 3) == true
p divisible_by?(15, 2) == false
p divisible_by?(15, 0) == false

fizzbuzz(1, 15)
