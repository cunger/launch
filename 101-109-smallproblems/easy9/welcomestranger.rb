
def greetings(name_parts, profession_parts)
  name = name_parts.join(' ')
  profession = profession_parts[:title] + ' ' + profession_parts[:occupation]

  puts "Hello, #{name}! Nice to have a #{profession} around."
end

## Example

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
