def cardinal_string(num)
  num_str = num.to_s
  # regular cases
  ending = case num_str[-1]
           when '1' then 'st'
           when '2' then 'nd'
           when '3' then 'rd'
           else 'th'
           end
  # exceptions
  ending = 'th' if %w(11 12 13).include? num_str[-2..-1]
  # result
  num_str + ending
end

def century1(year)
  century, rest = year.divmod 100
  century += 1 if rest > 0
  cardinal_string century
end

def century2(year)
  century = ((year - 1) / 100) + 1
  cardinal_string century
end

# Other alternatives:
# Matt Borgman: century = (year / 100.0).ceil

## Tests

p century1(2000) == '20th'
p century1(2001) == '21st'
p century1(1965) == '20th'
p century1(256) == '3rd'
p century1(5) == '1st'
p century1(10103) == '102nd'
p century1(1052) == '11th'
p century1(1127) == '12th'
p century1(11201) == '113th'

p century2(2000) == '20th'
p century2(2001) == '21st'
p century2(1965) == '20th'
p century2(256) == '3rd'
p century2(5) == '1st'
p century2(10103) == '102nd'
p century2(1052) == '11th'
p century2(1127) == '12th'
p century2(11201) == '113th'
