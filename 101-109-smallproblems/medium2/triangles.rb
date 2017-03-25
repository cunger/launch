
def triangle(side1, side2, side3)
  lengths = [side1, side2, side3].sort

  return :invalid if lengths[0] + lengths[1] <= lengths[2]

  case lengths.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  else :scalene
  end
end

def tri_angle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  case
  when angles.reduce(:+) != 180,
       angles.any? { |angle| !angle.positive? }
    :invalid
  when angles.any? { |angle| angle == 90 }
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  when angles.any? { |angle| angle > 90 }
    :obtuse
  end
end

## Tests

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

p tri_angle(60, 70, 50) == :acute
p tri_angle(30, 90, 60) == :right
p tri_angle(120, 50, 10) == :obtuse
p tri_angle(0, 90, 90) == :invalid
p tri_angle(50, 50, 50) == :invalid
