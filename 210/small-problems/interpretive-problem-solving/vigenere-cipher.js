// Input: plaint text message (string), key (string)
// Output: cipher text (string)

// * transform key into array of shift values,
//   taking its index value in a-z, and
//   repeating it until we have an array that is at least as long as the input string
//
// * for each char in the input string:
//   if it's a letter, map it to its cipher by Caesar-shifting it,
//   using the next shift value

var ALPHABET = 'abcdefghijklmnopqrstuvwxyz';

function encrypt(plainText, key) {
  if (plainText === '' || key === '') return plainText;

  var shiftValues = key.toLowerCase().split('').map(c => ALPHABET.indexOf(c));
  while (shiftValues.length < plainText.length) {
    shiftValues = shiftValues.concat(shiftValues);
  }

  var cipherText = '';
  var j = 0;
  var i;
  for (i = 0; i < plainText.length; i++) {
    var char = plainText[i];
    var cipher = char;

    if (isLetter(char)) {
      cipher = shiftRight(char.toLowerCase(), shiftValues[j]);
      j++;
      if (isUpperCase(char)) {
        cipher = cipher.toUpperCase();
      }
    }

    cipherText += cipher;
  }

  return cipherText;
}

function isLetter(char) {
  return /[a-zA-Z]/.test(char);
}

function isUpperCase(char) {
  return /[A-Z]/.test(char);
}

function shiftRight(char, n, alphabet) {
  var newIndex = ALPHABET.indexOf(char) + n;
  while (newIndex >= ALPHABET.length) {
    newIndex -= ALPHABET.length;
  }

  return ALPHABET[newIndex];
}

console.log(shiftRight('a', 1) === 'b');
console.log(shiftRight('y', 3) === 'b');

console.log(encrypt("Pineapples don't go on pizzas!", "meat") === "Bmnxmtpeqw dhz'x gh ar pbldal!");
console.log(encrypt("The quick brown fox jumps over the lazy dog!", "F") === "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!");
console.log(encrypt("", "abc") === "");
console.log(encrypt("Fnord", "") === "Fnord");
