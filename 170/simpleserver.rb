require 'socket'

ACTIVITIES = { 1 => 'Go for a walk.',
               2 => 'Say something nice on the LS Slack channels.',
               3 => 'Buy bitcoins.',
               4 => 'Look up your IP address.',
               5 => 'Google "sad monkeys Japan".',
               6 => 'Brew coffee.',
               7 => 'Google "monkey tail beard"' }

prev = nil

server = TCPServer.new('localhost', 3003)
loop do
  client = server.accept

  request_line = client.gets
  puts request_line

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"

  if request_line =~ /GET\s+\/what-to-do(\s|\?)/
    prev = request_line[/\?prev=(\d+)?/, 1]
    begin
      key = ACTIVITIES.keys.sample
      activity = ACTIVITIES[key]
    end until key != prev
    prev = key

    client.puts "<html><body>"
    client.puts "<h3>How about this?</h3>"
    client.puts "<p>#{activity}</p>"
    client.puts "<a href='/what-to-do?prev=#{prev}'>Nope, give me another one</a>"
    client.puts "</body></html>"
  else
    client.puts 'Fnord!'
  end

  client.close
end
