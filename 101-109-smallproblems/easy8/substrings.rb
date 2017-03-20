
def substrings_at_start(str)
  substrings = []
  0.upto(str.length - 1) { |n| substrings << str[0..n] }
  substrings
end

def substrings(str)
  substrings = []
  0.upto(str.length - 1) { |n| substrings += substrings_at_start(str[n..-1]) }
  substrings
end

## Tests

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
