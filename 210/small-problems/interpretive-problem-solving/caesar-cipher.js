// Requirements:
// * right-shifting each letter by n positions, wrapping at the end
// * preserve case
// * leave non-letter characters as they are

// Approach:
// Given: alphabet of lower and upper case letters (arrays)
// Input: plain text string, integer n
// split into characters and map each char to its cipher:
//   if in one of the alphabets, increase index of char by n
//   while index >= array.length: index -= array.length

function caesarEncrypt(plainText, key) {
  var LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  var isLowerCaseLetter = function (c) { return /[a-z]/.test(c); };
  var isUpperCaseLetter = function (c) { return /[A-Z]/.test(c); };

  return plainText.split('').map(function (char) {
    var index = Math.max(LETTERS.indexOf(char),
                         LETTERS.indexOf(char.toUpperCase()));

    if (index === -1) return char;

    if (key > 0) index = shiftRight(index, key, LETTERS.length);
    if (key < 0) index = shiftLeft(index, -key, LETTERS.length);

    var cipher = LETTERS[index];
    if (isLowerCaseLetter(char)) {
      cipher = cipher.toLowerCase();
    }

    return cipher;
  }).join('');
}

function caesarDecrypt(cipherText, key) {
  return caesarEncrypt(cipherText, -key);
}

function shiftRight(index, positions, length) {
  index += positions;

  while (index >= length) {
    index -= length;
  }

  return index;
}

function shiftLeft(index, positions, length) {
  index -= positions;

  while (index < 0) {
    index += length;
  }

  return index;
}

// simple shift
console.log(caesarEncrypt('A', 0) === 'A');
console.log(caesarEncrypt('A', 3) === 'D');

// wrap around
console.log(caesarEncrypt('y', 5) === 'd');
console.log(caesarEncrypt('a', 47) === 'v');

// all letters
console.log(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25) === 'ZABCDEFGHIJKLMNOPQRSTUVWXY');
console.log(caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5) === 'Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!');

// many non-letters
console.log(caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2) === 'Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?');

// decrypting again
console.log(caesarDecrypt(caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5), 5) === 'The quick brown fox jumps over the lazy dog!');
