
def swap_name(name)
  parts = name.split(' ')
  "#{parts[1]}, #{parts[0]}"
  # Nice alternative: name.split(' ').reverse.join(', ')
end

## Test

p swap_name('Joe Roberts') == 'Roberts, Joe'
