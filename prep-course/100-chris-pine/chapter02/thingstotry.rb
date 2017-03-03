require 'date'

# Simple multiplication

hours_in_a_year = 365 * 24
minutes_in_a_decade = 10 * 365 * 24 * 60

puts 'Hours in a year: ' + hours_in_a_year.to_s
puts 'Minutes in a decade: ' + minutes_in_a_decade.to_s

my_age_in_seconds_rough = 34 * 365 * 24 * 60 * 60

puts 'My age in seconds (rough): ' + my_age_in_seconds_rough.to_s

# Trying DateTime

BIRTHDAY = DateTime.new(1982, 5, 5, 15)

my_age_in_seconds = Proc.new do
  diff_in_days = DateTime.now - BIRTHDAY
  (diff_in_days * 24 * 60 * 60).to_i
end

puts 'My birthdatetime: ' + BIRTHDAY.to_s
puts 'My age in seconds (not so rough): ' + my_age_in_seconds.call.to_s
sleep 1
puts 'And now: ' + my_age_in_seconds.call.to_s

# And checking out Chris

authors_age_in_seconds = 1_160_000_000
authors_age_in_years = authors_age_in_seconds / 60 / 60 / 24 / 365
# left-to-right bracketing, so == (((authors_age_in_seconds / 60) / 60) / 24) / 365

puts "The author's age: " + authors_age_in_years.to_s
puts "(So we're #{(authors_age_in_years - 34).abs} years apart.)"
