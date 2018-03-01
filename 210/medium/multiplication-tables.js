var row;
var i;
var j;

function padLeft(number) {
  var stringNumber = String(number);
  return stringNumber.length <= 1 ? ' ' + stringNumber : stringNumber;
}

for (i = 1; i <= 10; i += 1) {
  row = '';
  for (j = 1; j <= 10; j += 1) {
    row += padLeft(i * j) + ' ';
  }

  console.log(row + '\n');
}
