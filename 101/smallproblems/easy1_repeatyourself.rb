
def repeat(str, num)
  num.times { puts str }
end

## Notes

# String#* is defined only for non-negative integers, so
#   puts str * num
# will throw an error for negative num.

## Examples

repeat("You can't see me.", 0)
repeat("Now you can...", 1)
repeat("Yay!", 3)
repeat("And gone again...", -1)
