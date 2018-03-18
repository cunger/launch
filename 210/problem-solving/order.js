// Input: string, in which each word contains exactly one integer from 1 to 9
// Output: string, in which the words are ordered according to their integer

// Tests

console.log(order("is2 Thi1s T4est 3a") === "Thi1s is2 3a T4est");
console.log(order("") === "");

// Approach:
// split input string into words, sort by the integer they contain, and join again

function order(string) {
  const byContainedInteger = function(word1, word2) {
    var i1 = word1.match(/[1-9]/)[0];
    var i2 = word2.match(/[1-9]/)[0];
    return Number(i1) - Number(i2);
  };

  return string.split(' ')
               .sort(byContainedInteger)
               .join(' ');
}
