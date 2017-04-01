
arr = ['10', '11', '9', '7', '8']

p arr.sort { |x, y| y.to_i <=> x.to_i }
p arr.sort_by { |x| x.to_i }.reverse
