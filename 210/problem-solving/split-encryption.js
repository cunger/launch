// Encrypt
//
// Input: plain text string, integer n
// Output: encrypted string
//
// Repeat n times: take every 2nd char from the string, join, and concatenated with the join of the other chars
//
// set encrypted to input string
// for 1..n:
//   for each char:
//     if odd index, add to first half
//     else add to second half
//   set encrypted to first half + second half
// return encrypted

function encrypt(plainText, n) {
  var encrypted = plainText;
  var firstHalf;
  var secondHalf;
  var i;
  for (i = 1; i <= n; i++) {
    firstHalf  = '';
    secondHalf = '';

    encrypted.split('').forEach(function (char, index) {
      if (index % 2 === 0) {
        secondHalf += char;
      } else {
        firstHalf += char;
      }
    });

    encrypted = firstHalf + secondHalf;
  }

  return encrypted;
}

// Decrypt

// Input: encrypted string, integer n
// Output: plain text string

// Approach: reverse the encryption process
// n times:
//   - split encrypted string into two halfs (with Math.floor, so first half is shorter if they are unequal)
//   - first char of second half + first char of first half
//   + second char of second half + second char of first half
//   etc

function decrypt(encryptedText = '', n = 0) {
  var decrypted = encryptedText;
  var center = Math.floor(encryptedText.length / 2);
  var firstHalf;
  var secondHalf;
  var j;
  var i;
  for (i = 1; i <= n; i++) {
    firstHalf    = decrypted.slice(0, center);
    secondHalf   = decrypted.slice(center);
    newDecrypted = '';

    for (j = 0; j < secondHalf.length; j++) {
      newDecrypted += secondHalf[j];
      if (firstHalf[j]) newDecrypted += firstHalf[j];
    }

    decrypted = newDecrypted;
  }

  return decrypted;
}

console.log(encrypt('This is a test!', 2));
console.log(encrypt('This is a test!', 4));
console.log(decrypt('Test', 4));
console.log(decrypt('tseT', 2));
