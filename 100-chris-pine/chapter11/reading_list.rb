# require_relative '../chapter10/sort'

path_to_dropbox = '/home/christina/Dropbox/private/'
file_names = Dir[ path_to_dropbox + 'cetaceans/**/*.pdf' ] +
             Dir[ path_to_dropbox + 'launchschool/**/*.pdf' ] +
             Dir[ path_to_dropbox + 'comics/**/*.pdf' ] +
             Dir[ path_to_dropbox + 'training/**/*.pdf' ]

# file_names = shuffle(file_names)
# (Gonna pick items randomly, so no real need to shuffle...)

# Determine length of reading list (and avoid making it too long).

max_length = 10
if (file_names.size > max_length)
  length = rand(max_length)
else
  length = rand(file_names.size)
end

puts "Building a reading list with #{length} things to read..."

# Pick random items to put on the list.

reading_list = []
length.times do
  index = rand(file_names.size)
  reading_list << file_names[index]
  file_names.delete(index)
end

# Show it.

puts "Here it is!"
puts "* " + reading_list.join("\n* ")
