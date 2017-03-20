
def fizzbuzz(start_num, end_num)
  output = []
  start_num.upto(end_num) do |num|
    output << fizzbuzz_value(num)
  end
  puts output.join(', ')
end

def divisible_by?(num, divisor)
  num % divisor == 0
end

def fizzbuzz_value(num)
  case
  when divisible_by?(num, 3) && divisible_by?(num, 5)
    'FizzBuzz'
  when divisible_by?(num, 3)
    'Fizz'
  when divisible_by?(num, 5)
    'Buzz'
  else
    num
  end
end

## Example

fizzbuzz(1, 15)
fizzbuzz(8, 0)
