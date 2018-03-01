function doubler(number, caller) {
  console.log('This function was called by ' + caller + '.');
  return number + number;
}

console.log(doubler(5, 'Victor')); // This function was called by Victor. // 10

function makeDoubler(caller) {
  return function (number) { return doubler(number, caller); };
}

var dup = makeDoubler('Victor');
console.log(dup(5)); // This function was called by Victor. // 10
