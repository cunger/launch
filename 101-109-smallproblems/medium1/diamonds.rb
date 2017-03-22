
def diamond(n)
  return '' if n.even?

  lines = ['*' * n]
  1.upto(n / 2) do |i|
    spaces = ' ' * i
    stars  = '*' * (n - (i * 2))
    line   = spaces + stars + spaces
    lines  = [line] + lines + [line]
  end
  lines.join("\n")
end

def hollow_diamond(n)
  return ''  if n < 1 || n.even?
  return '*' if n == 1

  lines = ['*'.center(n)]
  counting = 1.upto(n - 2).to_a + (n - 4).downto(1).to_a
  counting.each do |spaces|
    next if spaces.even?
    line = '*' + ' ' * spaces + '*'
    lines << line.center(n)
  end
  lines += ['*'.center(n)]
  lines.join("\n")
end

## Examples

puts diamond(1)
puts diamond(3)
puts diamond(9)

puts hollow_diamond(11)
