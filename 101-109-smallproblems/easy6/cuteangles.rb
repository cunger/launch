
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60

def dms(float)
  float_within_360 = float.abs - ((float.abs / 360).to_i * 360)

  degrees, remainder = float_within_360.divmod 1
  minutes, remainder = (remainder * MINUTES_PER_DEGREE).divmod 1
  seconds = remainder * SECONDS_PER_MINUTE

  sign = float.negative? ? '-' : ''
  format(%(#{sign}%d°%02d'%02d"), degrees, minutes, seconds)
end

## Tests

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°35'59")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
p dms(440) == %(80°00'00")
p dms(-76.73) == %(-76°43'48")
