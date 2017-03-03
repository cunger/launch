require 'yaml'
require 'date'

birthdays = YAML.load(File.read('birthdays.yaml'))

puts "Give me a name:"
name = gets.chomp

if birthdays.key? name
  nickname = birthdays[name]['nickname']
  birthday = birthdays[name]['birthdate']
  age = ((Date.today - Date.parse(birthday)) / 365).to_i
  puts "#{nickname}'s birthday is on #{birthday}. He's now #{age} years old."
else
  puts "Hm, I wonder who that is..."
end
