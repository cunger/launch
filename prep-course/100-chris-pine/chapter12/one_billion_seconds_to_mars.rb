
birthday = Time.local(1982, 5, 5, 15)
now = Time.now

puts "This is when I passed one billion seconds of life time: #{birthday + 1_000_000_000}"

puts "Now to you..."

def get_int(prompt)
  str = ""
  until str =~ /^\d+$/
    puts prompt
    str = gets.chomp.strip
  end
  str.to_i
end

year  = get_int("Which year were you born in? (e.g. 1983)")
month = get_int("Which month? (e.g. 3)")
day   = get_int("Which day? (e.g. 24)")

puts "Hmm, #{year}-#{month}-#{day}..."

diff = now - Time.local(year, month, day)
diff = diff / 60 / 60 / 24 / 365

puts "So you're #{diff} years old!"
diff.to_i.times { puts "Hip hip hooray!" }
