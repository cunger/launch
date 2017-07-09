require 'date'

def friday_13th(year)
  count = 0
  (1..12).each do |month|
    count += 1 if Date.new(year, month, 13).friday?
  end
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1 
