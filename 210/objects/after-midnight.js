var MINUTES_PER_HOUR = 60;
var HOURS_PER_DAY = 24;
var MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR;

// function timeOfDay(deltaMinutes) {
//   var hours;
//   var minutes;
//
//   deltaMinutes = deltaMinutes % MINUTES_PER_DAY;
//   if (deltaMinutes < 0) {
//     deltaMinutes = MINUTES_PER_DAY + deltaMinutes;
//   }
//
//   hours = Math.floor(deltaMinutes / MINUTES_PER_HOUR);
//   minutes = deltaMinutes % MINUTES_PER_HOUR;
//
//   return padWithZeroes(hours, 2) + ':' + padWithZeroes(minutes, 2);
// }
//
// function afterMidnight(timeStr) {
//   var timeComponents = timeStr.split(':');
//   var hours = parseInt(timeComponents[0], 10);
//   var minutes = parseInt(timeComponents[1], 10);
//
//   return hours * MINUTES_PER_HOUR + minutes;
// }
//
// function beforeMidnight(timeStr) {
//   var deltaMinutes = MINUTES_PER_DAY - afterMidnight(timeStr);
//   if (deltaMinutes === MINUTES_PER_DAY) {
//     deltaMinutes = 0;
//   }
//
//   return deltaMinutes;
// }

function padWithZeroes(number, length) {
  var numberString = String(number);

  while (numberString.length < length) {
    numberString = '0' + numberString;
  }

  return numberString;
}

function timeOfDay(deltaMinutes) {
  var date = new Date(2000, 1, 1, 0, 0);
  date.setMinutes(deltaMinutes);

  return padWithZeroes(date.getHours(), 2) + ':'
       + padWithZeroes(date.getMinutes(), 2);
}

function beforeMidnight(timeStr) {
  var deltaMinutes = MINUTES_PER_DAY - afterMidnight(timeStr);
  if (deltaMinutes === MINUTES_PER_DAY) {
    return 0;
  } else {
    return deltaMinutes;
  }
}

function afterMidnight(timeStr) {
  var date = new Date('2000-01-01 ' + timeStr);
  return date.getHours() * MINUTES_PER_HOUR + date.getMinutes();
}

// Tests

console.log(timeOfDay(0) === "00:00");
console.log(timeOfDay(-3) === "23:57");
console.log(timeOfDay(35) === "00:35");
console.log(timeOfDay(-1437) === "00:03");
console.log(timeOfDay(3000) === "02:00");
console.log(timeOfDay(800) === "13:20");
console.log(timeOfDay(-4231) === "01:29");

console.log(afterMidnight('00:00') === 0);
console.log(beforeMidnight('00:00') === 0);
console.log(afterMidnight('12:34') === 754);
console.log(beforeMidnight('12:34') === 686);
