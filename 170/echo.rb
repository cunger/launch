require 'socket'

ACTIVITIES = [
              'Go for a walk.',
              'Say something nice on the LS Slack channels.',
              'Buy bitcoins.',
              'Look up your IP address.',
              'Google "sad monkeys Japan".',
              'Brew coffee.'
             ]

server = TCPServer.new('localhost', 3003)
loop do
  client = server.accept

  request_line = client.gets
  puts request_line

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/plain\r\n\r\n"

  if request_line =~ /GET\s+\/what-to-do\s+/
    client.puts ACTIVITIES.sample
  else
    client.puts 'Fnord!'
  end

  client.close
end
