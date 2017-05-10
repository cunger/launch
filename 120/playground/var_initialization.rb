while false
  name1 = 'alice'
end

p name1 # => nil

def blah
  if false
    name2 = 'alice'
  end
  p name2
end

blah

unicorn &&= 'alice'

p unicorn
