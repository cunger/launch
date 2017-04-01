
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

p arr.map { |subarr| subarr.select { |a| a % 3 == 0 } }
