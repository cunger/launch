
PADDING = 1
DELIMITER_SIZE = 1

MAX_LINE_LENGTH = 80
MAX_WIDTH = MAX_LINE_LENGTH - 2 * PADDING - 2 * DELIMITER_SIZE

HDELIMITER = '|'
VDELIMITER = '-'
CORNER = '+'

def padding(char=' ')
  char * PADDING
end

def print_in_box(str)

  lines = []
  line  = ''
  str.split(' ').each do |word|
    if (line + word + ' ').length <= MAX_WIDTH
      line << word + ' '
    else
      lines << line
      line = word
    end
  end
  lines << line

  width = lines.map(&:length).max

  lines.map! { |line| HDELIMITER + padding + line + ' ' * (width - line.length) + padding + HDELIMITER }

  horizontal = CORNER + padding(VDELIMITER) + VDELIMITER * width + padding(VDELIMITER) + CORNER
  vertical   = HDELIMITER + padding + ' ' * width + padding + HDELIMITER

  puts horizontal
  PADDING.times { puts vertical }
  puts lines
  PADDING.times { puts vertical }
  puts horizontal
end

## Examples

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...')
