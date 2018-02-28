function repeatedCharacters(string) {
  var chars = string.toLowerCase().split('');
  var counts = {};
  var count;

  chars.forEach(function (char) {
    if (!(char in counts)) {
      count = countOccurences(chars, char);
      if (count > 1) counts[char] = count;
    }
  });

  return counts;
}

function countOccurences(array, element) {
  return array.filter(function (a) { return a === element }).length;
}

// Examples

console.log(countOccurences(['f', 'n', 'o', 'o', 'o', 'r', 'd'], 'f'));
console.log(countOccurences(['f', 'n', 'o', 'o', 'o', 'r', 'd'], 'o'));
console.log(countOccurences(['f', 'n', 'o', 'o', 'o', 'r', 'd'], 'm'));

console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }
