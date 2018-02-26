// 1 + exploration

var today = new Date();

console.log(today);         // 2018-02-26T08:29:07.229Z
console.log(typeof(today)); // 'object'

console.log(Date.now());    // 1519633775731, type: number
console.log(Date());        // Mon Feb 26 2018 09:29:35 GMT+0100 (CET), type: string

function equal(date1, date2) {
  return date1.getTime() === date2.getTime();
}

var now = Date.now();

console.log(new Date(now) === new Date(now));
console.log(equal(new Date(now), new Date(now)));

// 2..8

function formattedDayOfWeek(n) {
  var DAYS_OF_WEEK = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

  return DAYS_OF_WEEK[n];
}

function formattedDayOfMonth(n) {
  function dateSuffix() {
    switch (n) {
      case 1:
      case 21:
      case 31:
        return 'st';
      case 2:
      case 22:
        return 'nd';
      case 3:
      case 23:
        return 'rd';
      default:
        return 'th';
    }
  }

  return String(n) + dateSuffix();
}

function formattedMonth(n) {
  var MONTHS = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  return MONTHS[n];
}

function formattedDate(date) {

  return formattedDayOfWeek(date.getDay()) + ', ' +
         formattedMonth(date.getMonth()) + ' ' +
         formattedDayOfMonth(date.getDate());
}

console.log('Today is ' + formattedDate(today) + '.');

// 11

var tomorrow = new Date();
tomorrow.setDate(tomorrow.getDate() + 1);

console.log('Tomorrow is ' + formattedDate(tomorrow) + '.');

// 14

function formattedTime(date) {
  function twoDigits(n) {
    return String(n).length == 1 ? '0' + String(n) : String(n);
  }
  return twoDigits(date.getHours()) + ':' + twoDigits(date.getMinutes());
}

console.log('It is now ' + formattedTime(new Date()) + '.');
console.log('Sometime it was ' + formattedTime(new Date(2013, 2, 1, 1, 10)) + '.');
