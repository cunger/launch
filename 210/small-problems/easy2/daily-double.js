
function crunch(string) {
  var crunched = '';

  var prevChar = '';
  var currChar;
  var i;

  for (i = 0; i< string.length; i++) {
    currChar = string[i];

    if (currChar !== prevChar) {
      crunched += prevChar;
      prevChar = currChar;
    }
  }

  crunched += prevChar;

  return crunched;
}

function crunchWithRegex(string) {
  return string.replace(/(.)\1+/g, '$1');
}

// Tests

console.log(crunch('ddaaiillyy ddoouubbllee') === 'daily double');
console.log(crunch('4444abcabccba') === '4abcabcba');
console.log(crunch('ggggggggggggggg') === 'g');
console.log(crunch('a') === 'a');
console.log(crunch('') === '');

console.log(crunchWithRegex('ddaaiillyy ddoouubbllee') === 'daily double');
console.log(crunchWithRegex('4444abcabccba') === '4abcabcba');
console.log(crunchWithRegex('ggggggggggggggg') === 'g');
console.log(crunchWithRegex('a') === 'a');
console.log(crunchWithRegex('') === '');
