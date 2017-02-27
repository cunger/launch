
# Note: `case` acts upon the first `when` clause that matches (and then automatically breaks)
# Note: this also holds for `if elsif`s

def judge(number)
  case number
  when 0
    "Haha!"
  when 23
    "Yay!"
  when 47
    "Woah!"
  when 0
    "Woot!"
  else
    "Mh..."
  end
end

puts judge(-10)
puts judge(23)
puts judge(47)
puts judge(0)

def polarity(number)
  case
  when number > 0
    "positive"
  when number < 0
    "negative"
  else
    "maybe positive, I guess..."
  end
end

puts polarity(-10)
puts polarity(10)
puts polarity(0)


def size(number)
  case
  when number > 0
    "ok"
  when number > 100
    "big"
  else
    "small"
  end
end

puts size(-10)
puts size(0)
puts size(10)
puts size(101)
