
def balanced?(str)
  opens = 0
  str.chars.each do |char|
    case char
    when '(' then opens += 1
    when ')' then opens -= 1
    end
    return false if opens.negative?
  end
  opens.zero?
end

PAIRS = { '(' => ')',
          '{' => '}',
          '[' => ']',
          '"' => '"',
          "'" => "'" }

def all_balanced?(str)
  stack = []
  str.chars.each do |char|
    if char == PAIRS[stack.last]
      stack.pop
    elsif PAIRS.key?(char)
      stack.push char
    end
  end
  stack.empty?
end

## Tests

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

p all_balanced?('([]{[]""})') == true
p all_balanced?("'(')") == false
