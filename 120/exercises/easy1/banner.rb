class Banner
  CONSOLE_WIDTH = 80

  def initialize(message, banner_width=nil)
    banner_width ||= (message.length + 4)

    @message = message
    @inner_width = computer_inner_width(message, banner_width)
  end

  def to_s
    [horizontal_rule,
     empty_line,
     message_line,
     empty_line,
     horizontal_rule].join("\n")
  end

  private

  def computer_inner_width(message, banner_width)
    longest_word_length = message.split.map(&:length).sort.last || 0
    [[banner_width, CONSOLE_WIDTH].min - 4, longest_word_length].max
  end

  def horizontal_rule
    '+' + '-' * (@inner_width + 2) + '+'
  end

  def empty_line
    '|' + ' ' * (@inner_width + 2) + '|'
  end

  def message_line
    lines = []
    line  = ''
    @message.split.each do |word|
      if (line + word).length > @inner_width
        lines << fill_up(line.strip)
        line = word + ' '
      else
        line += word + ' '
      end
    end
    lines << fill_up(line.strip)
    lines.join("\n")
  end

  def fill_up(str)
    left  = (@inner_width - str.length) / 2
    right = (@inner_width - str.length) - left
    '| ' + (' ' * left) + str + (' ' * right) + ' |'
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 2)
puts banner

banner = Banner.new('', 10)
puts banner

banner = Banner.new('Fnord', 9)
puts banner

banner = Banner.new('Fnord', 20)
puts banner

banner = Banner.new('This example demonstrates a block quote. Because some introductory phrases will lead naturally into the block quote, you might choose to begin the block quote with a lowercase letter. In this and the later examples we use “Lorem ipsum” text to ensure that each block quotation contains 40 words or more. Lorem ipsum dolor sit amet, consectetur adipiscing elit. (Organa, 2013, p. 234)')
puts banner

banner = Banner.new('This example demonstrates a block quote. Because some introductory phrases will lead naturally into the block quote, you might choose to begin the block quote with a lowercase letter. In this and the later examples we use “Lorem ipsum” text to ensure that each block quotation contains 40 words or more. Lorem ipsum dolor sit amet, consectetur adipiscing elit. (Organa, 2013, p. 234)', 40)
puts banner

banner = Banner.new('This example demonstrates a block quote. Because some introductory phrases will lead naturally into the block quote, you might choose to begin the block quote with a lowercase letter. In this and the later examples we use “Lorem ipsum” text to ensure that each block quotation contains 40 words or more. Lorem ipsum dolor sit amet, consectetur adipiscing elit. (Organa, 2013, p. 234)', 100)
puts banner
