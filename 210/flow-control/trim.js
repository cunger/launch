
function trim(string) {
  var i;
  var trimmed = '';
  var encounteredNonSpaceChar;

  // remove leading spaces
  encounteredNonSpaceChar = false;

  for (i = 0; i < string.length; i++) {
    if (encounteredNonSpaceChar) {
      trimmed += string[i];
    }
    else if (string[i] !== ' ') {
      encounteredNonSpaceChar = true;
      trimmed += string[i];
    }
  }

  string = trimmed;
  trimmed = '';

  // remove trailing spaces
  encounteredNonSpaceChar = false;

  for (i = string.length - 1; i >= 0; i--) {
    if (encounteredNonSpaceChar) {
      trimmed = string[i] + trimmed;
    }
    else if (string[i] !== ' ') {
      encounteredNonSpaceChar = true;
      trimmed = string[i] + trimmed;
    }
  }

  return trimmed;
}


// Examples

console.log('"' + trim('  abc  ') + '"');  // "abc"
console.log('"' + trim('abc   ') + '"');   // "abc"
console.log('"' + trim(' ab c') + '"');    // "ab c"
console.log('"' + trim(' a b  c') + '"');  // "a b  c"
console.log('"' + trim('      ') + '"');   // ""
console.log('"' + trim('') + '"');         // ""
