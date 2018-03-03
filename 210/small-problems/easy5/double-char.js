function repeater(string) {
  var doubled = '';

  string.split('')
        .forEach(function (char) {
           doubled += char + char;
        });

  return doubled;
}

function doubleConsonants(string) {
  // Based on Nick Johnson's regex:
  // return string.replace(/(?![aeiou0-9])\w/g, '$&$&');

  // Pete Hanson's suggestion:
  return string.replace(/(\w)/g, function(char) {
    return char.match(/[aeiou]/i)) ? char : (char + char);
  });
}

console.log(repeater('Hello') === 'HHeelllloo');
console.log(repeater('Good job!') === 'GGoooodd  jjoobb!!');
console.log(repeater('') === '');

console.log(doubleConsonants('String') === 'SSttrrinngg');
console.log(doubleConsonants('Hello-World!') === 'HHellllo-WWorrlldd!');
console.log(doubleConsonants('July 4th') === 'JJullyy 4tthh');
console.log(doubleConsonants('') === '');
