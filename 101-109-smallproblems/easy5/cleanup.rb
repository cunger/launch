
def cleanup(str)
  str.gsub(/[^\p{Alpha}]/,' ').squeeze(' ')
  # without regex:
  # cleanedup_chars = str.chars.map { |char| char =~ /\p{Alpha}/ ? char : ' ' }
  # cleanedup_chars.join.squeeze(' ')
end

## Test

p cleanup("---what's my +*& line?") == ' what s my line '
