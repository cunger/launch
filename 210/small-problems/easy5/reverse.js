function reverseNumber(number) {
  return parseInt(number.toString().split('').reverse().join(''), 10);
}

console.log(reverseNumber(12345) === 54321);
console.log(reverseNumber(12213) === 31221);
console.log(reverseNumber(456) === 654);
console.log(reverseNumber(12000) === 21); // Note that zeros get dropped!
console.log(reverseNumber(1) === 1);

function reverseSentence(text) {
  return text.split(' ').reverse().join(' ');
}

console.log(reverseSentence(''));                       // ""
console.log(reverseSentence('Hello World'));            // "World Hello"
console.log(reverseSentence('Reverse these words'));    // "words these Reverse"

function reverseWords(text) {
  function reverseWordIfLong(word) {
    return word.length < 5 ? word : word.split('').reverse().join('');
  }

  return text.split(' ')
             .map(reverseWordIfLong)
             .join(' ');
}

console.log(reverseWords('Professional'));             // "lanoisseforP"
console.log(reverseWords('Walk around the block'));    // "Walk dnuora the kcolb"
console.log(reverseWords('Launch School'));            // "hcnuaL loohcS"
