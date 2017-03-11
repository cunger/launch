#### PART 1 ####

def time_of_day(mins)
  hours_total, minutes = mins.abs.divmod 60
  hours = hours_total % 24
  if mins.negative?
    hours   = 23 - hours
    minutes = 60 - minutes
  end
  format('%02d:%02d', hours, minutes)
end

## Nicer, 'official' solution

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
#
# def time_of_day(delta_minutes)
#   delta_minutes =  delta_minutes % MINUTES_PER_DAY
#   hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
#   format('%02d:%02d', hours, minutes)
# end

SECONDS_PER_MINUTE = 60

def datetime(mins)
  start = Time.new(2000, 01, 02, 00, 00, 00)
  time = start + (mins * SECONDS_PER_MINUTE)
  time.strftime('%A %H:%M')
end

## Tests

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

p datetime(0)
p datetime(-3)
p datetime(35)
p datetime(-1437)
p datetime(3000)
p datetime(800)
p datetime(-4231)

#### PART 2 ####

def minutes(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  hours * 60 + minutes
end

def after_midnight(time_str)
  mins = minutes time_str
  mins = 0 if mins == MINUTES_PER_DAY
  mins
end

def before_midnight(time_str)
  mins = MINUTES_PER_DAY - minutes(time_str)
  mins = 0 if mins == MINUTES_PER_DAY
  mins
end

## Tests

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
