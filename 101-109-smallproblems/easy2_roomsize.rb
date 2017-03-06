
def to_feet(meters)
  meters * 3.28084
end

print "Length of the room in meters: "
length_meters = Float(gets.chomp)

print "Width of the room in meters: "
width_meters = Float(gets.chomp)

length_feet_part, rest = to_feet(length_meters).divmod(1)
length_inches_part = rest * 12
width_feet_part, rest = to_feet(width_meters).divmod(1)
width_inches_part = rest * 12

puts "So your room is #{length_meters.round(2)} meters long"\
  " and #{width_meters.round(2)} meters wide."\
  " That's #{length_feet_part} feet #{length_inches_part.round(2)} inches long"\
  " and #{width_feet_part} feet #{width_inches_part.round(2)} inches wide."

puts "Let me calculate..."

area_sqmeters = length_meters * width_meters
area_sqfeet = area_sqmeters * 10.7639

puts "The area of the room is #{area_sqmeters.round(2)} square meters."\
  " That's #{area_sqfeet.round(2)} square feet."
