
def find_index_of_fibonacci_number_with_length(num)
  if num < 2
    raise ArgumentError, 'You promised the input would be greater or equal to 2!'
  end

  fibonacci = [1, 1]
  loop do
    fibonacci << fibonacci[-1] + fibonacci[-2]
    digits = fibonacci.last.to_s.length
    return fibonacci.length if digits == num
  end
end

## Tests

p find_index_of_fibonacci_number_with_length(2) == 7
p find_index_of_fibonacci_number_with_length(10) == 45
p find_index_of_fibonacci_number_with_length(100) == 476
p find_index_of_fibonacci_number_with_length(1000) == 4782
p find_index_of_fibonacci_number_with_length(10000) == 47847
p find_index_of_fibonacci_number_with_length(1) == 1
