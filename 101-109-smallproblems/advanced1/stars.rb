
def star(n)
  star  = '*'
  space = ''

  half = []
  line = ''
  until line.length == n do
    line = star + space + star + space + star
    half << line.center(n)
    space += ' '
  end

  (half.reverse + [star * n] + half).join("\n")
end

def circle(radius)
  # Use Pythagoras (r^2 = x^2 + y^2)
  # to determine the coordinates on a quarter segment of the circle
  coordinates = (0..radius).map { |x| [x, Math.sqrt(radius**2 - x**2)] }
  # Map coordinates to a string
  quarter = coordinates.map { |_, y| ' ' * y + '*' }
  # Cut off half of it (hack to get a height that looks
  # approximately correct in the terminal)
  # quarter = quarter[(quarter.size / 2)..-1]
  # Assemble the quarter to a half, and the halves to a full cirlce
  half   = quarter.map { |line| (line.reverse + line).center(2 * radius + 2) }
  circle = half.reverse + half
  circle
end

## Examples

puts star(7)
puts ''
puts star(9)
puts ''

puts circle(7)  + ["\n\n"]
puts circle(10) + ["\n\n"]
puts circle(13) + ["\n\n"]
puts circle(18) + ["\n\n"]
puts circle(100)
