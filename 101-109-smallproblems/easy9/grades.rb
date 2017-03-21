
def get_grade(*scores)
  avg = scores.reduce(0, :+).fdiv scores.size
  grade avg
end

def grade(score)
  case score
  when 90..Float::INFINITY then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else 'F'
  end
end

## Tests

p get_grade(95, 90, 93) == 'A'
p get_grade(50, 50, 95) == 'D'
p get_grade(80, 80) == 'B'
p get_grade(110) == 'A'
p get_grade == 'F'
