
def transpose(matrix)
  rows = matrix.size
  columns = matrix.first.size

  new_matrix = []

  (0...columns).each do |c|
    row = []
    (0...rows).each do |r|
      row << matrix[r][c]
    end
    new_matrix << row
  end

  new_matrix
end

def transpose_square(matrix)
  # Note: The input array is bound to variable 'matrix'
  # that is local to this method. So even when reassigning
  # matrix[i][j], this affects 'matrix' but not the original object.

  rows = matrix.size
  columns = matrix.first.size

  (0...rows).each do |i|
    (0...columns).each do |j|
      matrix[j][i], matrix[i][j] = matrix[i][j], matrix[j][i]
    end
  end

  matrix
end

def transpose!(matrix)
  rows = matrix.size
  columns = matrix.first.size

  columns.times do |c|
    row = []
    rows.times do |r|
      row << matrix[r].shift
    end
    matrix << row
  end

  matrix.delete []
end

## Test

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

transpose! matrix
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
