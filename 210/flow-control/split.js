function splitString(string, delimiter) {
  if (delimiter === undefined) {
    console.log('ERROR: No delimiter');
    return;
  }

  var substring = '';
  var i;
  for (i = 0; i < string.length; i++) {
    if (delimiter === '') {
      console.log(string[i]);
    } else {
      if (string[i] === delimiter) {
        console.log(substring);
        substring = '';
      } else {
        substring += string[i];
      }
    }
  }
  if (substring !== '') console.log(substring);
}

// Examples

console.log('------');
splitString('abc,123,hello world', ',');
// abc
// 123
// hello world

console.log('------');
splitString('hello');
// ERROR: No delimiter

console.log('------');
splitString('hello', '');
// h
// e
// l
// l
// o

console.log('------');
splitString('hello', ';');
// hello

console.log('------');
splitString(';hello;', ';');
//  (this is a blank line)
// hello
