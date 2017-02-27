require 'uri'
require 'httparty'
require 'json'
require 'csv'

puts "Which artist are you looking for?"
artist = gets.chomp

url  = 'https://api.spotify.com/v1/search?type=artist&q=' + URI.encode(artist)
json = HTTParty.get(url).parsed_response
results = json["artists"]["items"]

if results.empty?
  puts "Sorry, didn't find any artists that match '#{artist}'."
  exit
end

begin
  # Write results to CSV file.
  CSV.open("results.csv","wb") do |csv|
    csv << ["artist", "followers", "genres"]
    results.each do |result|
      name      = result["name"]
      followers = result["followers"]["total"]
      genres    = result["genres"].join(", ") # CSV automatically puts quotes around this string
      csv << [name, followers, genres]
    end
  end
  # Read results from that CSV file
  puts "Content of results.csv:"
  CSV.foreach("results.csv", headers: true, header_converters: :symbol) do |row|
    puts "* #{row[:artist]} (#{row[:followers]} followers) #{row[:genres]}"
  end
rescue Exception => e
  puts e.message
end
