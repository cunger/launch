
def flatten(obj)

  if obj.is_a? Array
    flat_arr = []
    obj.each do |element|
      flat_element = flatten(element)
      if flat_element.is_a? Array
        flat_arr += flat_element
      else
        flat_arr << flat_element
      end
    end
    return flat_arr
  end

  return obj
end

example = [1, 2, [3, 4, [5]], [[]], 6]

puts flatten(example).to_s
puts flatten([]).to_s
puts flatten(1).to_s
puts flatten("fnord").to_s
