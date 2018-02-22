function startsWith(string, prefix) {
  var i;
  for (i = 0; i < prefix.length; i++) {
    if (string[i] !== prefix[i]) {
      return false;
    }
  }
  return true;
}

// Example

var str = 'We put comprehension above all else';
console.log(startsWith(str, 'We'));      // true
console.log(startsWith(str, 'We put'));  // true
console.log(startsWith(str, ''));        // true
console.log(startsWith(str, 'put'));     // false

var longerStr = 'We put comprehension above all else!';
console.log(startsWith(str, longerStr)); // false
