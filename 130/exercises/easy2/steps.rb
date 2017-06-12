
def step1(start_value, end_value, step_size)
  value = start_value
  while value <= end_value
    yield value
    value += step_size
  end
end

def step2(start_value, end_value, step_size, &block)
  (start_value..end_value).step(step_size, &block)
end

p step1(1, 10, 3) { |value| puts "value = #{value}" }
p step2(1, 10, 3) { |value| puts "value = #{value}" }
