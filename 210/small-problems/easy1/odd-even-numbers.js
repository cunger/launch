function logEverySecondNumber(start, end) {
  var n;
  for (n = start; n <= end; n += 2) {
    console.log(n);
  }
}

var input = prompt('Up to which number?');
var end = Number(input) || 99;

console.log('Logging odd numbers up to ' + String(end) + ':');
logEverySecondNumber(1, end);

console.log('Logging even numbers up to ' + String(end) + ':');
logEverySecondNumber(2, end);
