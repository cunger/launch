def xor?(bool1, bool2)
  # (bool1 || bool2) && !(bool1 && bool2)
  (bool1 && !bool2) || (!bool1 && bool2)
end

## Tests

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?,  4.odd?)  == true
p xor?(5.odd?,  4.even?) == false
p xor?(5.even?, 4.odd?)  == false
