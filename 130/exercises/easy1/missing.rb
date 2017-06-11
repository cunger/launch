
def missing(arr)
  return [] if arr.empty?
  (arr.first..arr.last).select { |n| !arr.include?(n) }
  # without blocks:
  # (arr.first..arr.last).to_a - arr 
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
p missing([3, 1]) == []
