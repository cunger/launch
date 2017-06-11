
def compute
  return 'Does not compute.' unless block_given?
  yield
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def compute_with_args(*args)
  return 'Does not compute.' unless block_given?
  yield *args
end

p compute_with_args(100, 2, 40) { |n1, n2, n3| n1 + n2 * n3 } == 180
p compute_with_args('>>') { |s| "#{s} Hello world!" } == '>> Hello world!'
p compute_with_args { 42 } == 42
p compute_with_args([]) == 'Does not compute.'
p compute_with_args == 'Does not compute.'
