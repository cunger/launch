
def time_correct(time)
  return nil unless time =~ /\d{2}:\d{2}:\d{2}/

  hours, minutes, seconds = time.split(':').map(&:to_i)

  if seconds > 59
    minutes += 1
    seconds -= 60
  end

  if minutes > 59
    hours += 1
    minutes -= 60
  end

  until hours < 24
    hours -= 24
  end

  [format('%02d',hours), format('%02d',minutes), format('%02d',seconds)].join(':')
end

p time_correct("001122").nil?
p time_correct("00;11;22").nil?
p time_correct("0a:1c:22").nil?

p time_correct("09:10:01") == "09:10:01"
p time_correct("11:70:10") == "12:10:10"
p time_correct("19:99:99") == "20:40:39"
p time_correct("24:01:01") == "00:01:01"
p time_correct("52:01:01") == "04:01:01"
