
def triangle(num, corner_v = :down, corner_h = :right, filler = '*', blank = ' ')

  num.times do |i|
    i += 1

    case corner_v
    when :up
      amount_blank  = i
      amount_filler = num - i
    when :down
      amount_filler = i
      amount_blank  = num - i
    end

    blanks  = blank  * amount_blank
    fillers = filler * amount_filler

    case corner_h
    when :left
      left  = fillers
      right = blanks
    when :right
      left  = blanks
      right = fillers
    end

    puts left + right
  end
end

## Examples

triangle(6, :up, :left)
triangle(6, :up, :right)
triangle(6, :down, :left, '+')
triangle(6, :down, :right, '+', '-')
