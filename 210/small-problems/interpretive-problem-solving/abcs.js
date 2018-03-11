// Check whether a string can be composed of letter blocks,
// following two rules:
// * Only one letter from each block.
// * Each block only once.

// Input: string
// Output: boolean

// Solution:
// Use each block A, B as regex /A|B/ig, and check whether it matches more than once.

function isBlockWord(string) {
  if (typeof(string) !== 'string') return false;

  const BLOCKS  = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
                   ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
                   ['V', 'I'], ['L', 'Y'], ['Z', 'M']];

  const toRegex = function (block) {
      return new RegExp(block[0] + '|' + block[1], 'ig');
  };
  const isUsedMoreThanOnce = function (block) {
    return (string.match(toRegex(block)) || []).length > 1;
  };

  return !BLOCKS.some(isUsedMoreThanOnce);
}

console.log(isBlockWord('BATCH') === true);
console.log(isBlockWord('BUTCH') === false);
console.log(isBlockWord('jest') === true);
console.log(isBlockWord('floW') === true);
console.log(isBlockWord('APPLE') === false);
console.log(isBlockWord('apple') === false);
console.log(isBlockWord('apPLE') === false);
console.log(isBlockWord('Box') === false);
