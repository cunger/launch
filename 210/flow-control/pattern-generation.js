
function generatePattern(n) {
  var toShow = 1;
  var i;
  for (i = 1; i <= n; i++) {
    var string = '';
    var j;
    for (j = 1; j <= i; j++) {
      string += String(j);
    }
    for (j; j <= n; j++) {
      for (k = 1; k <= String(j).length; k++) {
        string += '*';
      }
    }
    console.log(string);
    toShow++;
  }
}

// Example:

generatePattern(7);

// 1******
// 12*****
// 123****
// 1234***
// 12345**
// 123456*
// 1234567

generatePattern(20);
