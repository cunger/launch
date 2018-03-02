function dms(angle) {
  var MINUTES_PER_DEGREE = 60
  var SECONDS_PER_MINUTE = 60

  // make sure angle is in (0..360)
  angle = Math.abs(angle) - Math.floor(angle / 360) * 360;

  var degrees   = Math.floor(angle);
  var remainder = MINUTES_PER_DEGREE * (angle - degrees);
  var minutes   = Math.floor(remainder);
  var seconds   = Math.floor(SECONDS_PER_MINUTE * (remainder - minutes));

  return String(degrees) + '˚' + format(minutes) + '\'' + format(seconds) + '"';
}

function format(number) {
  var str = String(number);

  if (str.length == 1) {
    str = '0' + str;
  }
  
  return str;
}

console.log(dms(30));           // 30°00'00"
console.log(dms(76.73));        // 76°43'48"
console.log(dms(254.6));        // 254°35'59"
console.log(dms(93.034773));    // 93°02'05"
console.log(dms(0));            // 0°00'00"
console.log(dms(360));          // 360°00'00" or 0°00'00"
