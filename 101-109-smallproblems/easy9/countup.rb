
def sequence(num)
  (1..num).to_a
end

## Tests

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(0) == []
p sequence(-1) == []
