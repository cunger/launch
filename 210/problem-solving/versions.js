// Compare two version numbers.

// Input: two version numbers in the format x.y.z, as string
// Output:
// version1 > version2 => 1
// version1 < version2 => -1
// version1 === version2 => 0

// Examples:
// 0.1 < 1
// 1 === 1.0
// 1.0 < 1.1
// 1.1 < 1.2
// 1.2 ==== 1.2.0.0
// 1.2 < 1.18.2
// 1.18 < 13

console.log(compare('1.', '') === null);
console.log(compare('.1', '') === null);
console.log(compare('1..0', '') === null);
console.log(compare('1.x', '') === null);
console.log(compare('blah', '') === null);
console.log(compare('blah 1.0 blubb', '') === null);

console.log(compare('0.1', '1') === -1);
console.log(compare('1', '1') === 0);
console.log(compare('1', '1.0') === 0);
console.log(compare('1.0', '1.1') === -1);
console.log(compare('1.2', '1.1') === 1);
console.log(compare('1.2', '1.2.0.0') === 0);
console.log(compare('1.2', '1.18.2') === -1);
console.log(compare('1.18.2', '1.2') === 1);
console.log(compare('13', '1.18') === 1);
console.log(compare(' 1.0 ', ' 1 ') === 0);

// Solution:
// Compare the parts of the two version numbers one by one.
// (Pad shorter one with 0s.)
// Whenever one part is smaller than the other, the version number is smaller.
// If you hit the end without this happening, they are equal.

// Algorithm:
// * split version numbers into numeric parts => e.g. [1, 2, 0, 0] and [1, 2]
// * fill up the smaller array with 0s until they have the same length, and take an arbitrary one as starting point
// * iterate over the array, from start to end index (i)
//     * if array1[i] !== array2[i]: return comparison result
//     * else proceed with next index
//     * if there is no next index (i.e. after the iteration), return 0

function compare(version1, version2) {
  var VERSION_FORMAT = /^\s?\d+(\.\d+)*\s?$/;
  if (!version1.match(VERSION_FORMAT)) return null;
  if (!version2.match(VERSION_FORMAT)) return null;

  var version1parts = version1.trim().split('.').map(Number);
  var version2parts = version2.trim().split('.').map(Number);

  if (version1parts.length < version2parts.length) {
    fillUp(version1parts, 0, version2parts.length);
  } else
  if (version2parts.length < version1parts.length) {
    fillUp(version2parts, 0, version1parts.length);
  }

  for (var i = 0; i < version1parts.length; i += 1) {
    if (version1parts[i] < version2parts[i]) {
      return -1;
    } else
    if (version1parts[i] > version2parts[i]) {
      return 1;
    }
  }

  return 0;
}

function fillUp(array, value, targetLength) {
  for (var i = array.length; i < targetLength; i += 1) {
    array.push(value);
  }
}
