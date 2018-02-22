// One index + length

function substr(string, start, length) {
  if (length <= 0) return '';
  if (start < 0) start = string.length + start;

  var end = Math.min(start + length, string.length);
  var substring = '';
  var i;
  for (i = start; i < end; i++) {
    substring += string[i];
  }

  return substring;
}

// Examples

var string = 'hello world';

console.log('-------');
console.log('"' + substr(string, 2, 4) + '"');   // "llo "
console.log('"' + substr(string, -3, 2) + '"');  // "rl"
console.log('"' + substr(string, 8, 20) + '"');  // "rld"
console.log('"' + substr(string, 0, -20) + '"'); // ""
console.log('"' + substr(string, 0, 0) + '"');   // ""

// Two indices

function substring(string, start, end) {
  if (end === undefined) end = string.length;

  start = Math.max(0, Number(start) || 0);
  end = Math.max(0, Number(end) || 0);

  if (end > string.length) end = string.length
  if (start > end) {
    var temp = start;
    start = end;
    end = temp;
  }

  var substring = '';
  var i;
  for (i = start; i < end; i++) {
    substring += string[i];
  }

  return substring;
}

// Examples

console.log('-------');
console.log('"' + substring(string, 2, 4) + '"');   // "ll"
console.log('"' + substring(string, 4, 2) + '"');   // "ll"
console.log('"' + substring(string, 0, -1) + '"');  // ""
console.log('"' + substring(string, 2) + '"');      // "llo world"
console.log('"' + substring(string, 'a') + '"');    // "hello world"
console.log('"' + substring(string, 8, 20) + '"');  // "rld"
