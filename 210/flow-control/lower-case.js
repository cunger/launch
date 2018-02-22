function toLowerCase(string) {
  var A = 65;
  var Z = 90;
  var CONVERSION_OFFSET = 32;

  var loweredString = '';
  var i;
  for (i = 0; i < string.length; i++) {
    var ascii = string[i].charCodeAt(0);
    if (ascii >= A && ascii <= Z) {
      ascii += CONVERSION_OFFSET;
    }

    loweredString += String.fromCharCode(ascii);
  }

  return loweredString;
}

// Examples

console.log(toLowerCase('ALPHABET')); // "alphabet"
console.log(toLowerCase('123'));      // "123"
console.log(toLowerCase('abcDEF'));   // "abcdef"
