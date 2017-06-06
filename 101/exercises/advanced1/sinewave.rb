## Rafael Dwan

def sinewave(int)
  firstspace = 1
  midspaces = int.downto(1).map { |i| 1 + (2 * (i - 1)) }
  first = 0
  second = -1
  int.times do
    print "*#{" " * midspaces[first]}"  #first line
  end
  puts
  first += 1
  (int-1).times do

    print "#{" " * firstspace}*"
    (int-1).times do
      print "#{' ' * midspaces[first]}*#{' ' * midspaces[second]}*"
    end
    puts
    second -= 1
    first += 1
    firstspace += 1
  end
  print " " * firstspace
  (int).times do
    print "*#{" " * midspaces[second]}"  #last line
  end
end

sinewave(13)

## Alex Henegar

def print_row_circle(r, y)
  # y / x pixel heights of the fonts used in the command line I am using.
  scale = (18.0 / 8.0) # used to take a skewed output and make it 1:1
  num_spaces = 2 * Math.sqrt(r**2 - y**2) * scale
  # leave room for 2 stars unless row contains only 2 stars or less
  num_spaces -= 2 if num_spaces >= 2
  spaces = ' ' * num_spaces
  output = Array.new(2, '*').join(spaces)
  puts output.center((2 * r * scale))
end

def circle(d)
  r = d / 2
  r.downto(1) { |dist| print_row_circle(r, dist) }
  1.upto(r) { |dist| print_row_circle(r, dist) }
end

circle(25)

def print_row_sine(amp, t, period, phase_shift, vert_shift=amp)
  omega = 2 * Math::PI / period
  y = amp * Math.sin( omega * t - phase_shift) + vert_shift
  # y / x pixel heights of the fonts used in the command line I am using.
  scale = (18.0 / 8.0) # used to take a skewed output and make it 1:1
  num_spaces = y / scale
  spaces = ' ' * num_spaces
  output = spaces + '|'
  puts output
end

def sine(amp, period, phase_shift)
  # print 2 periods
  0.upto(2 * period.round) { |t| print_row_sine(amp, t, period, phase_shift) }
end

sine(40, 10 * Math::PI, 0)
