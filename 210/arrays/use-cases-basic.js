function firstElementOf(arr) {
  return arr[0];
}

function lastElementOf(arr) {
  return arr[arr.length - 1]; // or, slightly less clear: arr.slice(-1)[0]
}

console.log(firstElementOf(['U', 'S', 'A']) === 'U');
console.log(lastElementOf(['U', 'S', 'A']) === 'A');

function nthElementOf(arr, index) {
  return arr[index];
}

function firstNOf(arr, count) {
  return arr.slice(0, count);
}

function lastNOf(arr, count) {
  return arr.slice(-count);
}

var digits = [4, 8, 15, 16, 23, 42];

console.log(nthElementOf(digits, 3));   // 16
console.log(nthElementOf(digits, 8));   // undefined
console.log(nthElementOf(digits, -1));  // undefined
console.log(firstNOf(digits, 3)); // [4, 8, 15]
console.log(lastNOf(digits, 3)); //  [16, 23, 42]
console.log(lastNOf(digits, 10)); //  [4, 8, 15, 16, 23, 42]

function endsOf(beginningArr, endingArr) {
  return [beginningArr[0], endingArr[endingArr.length -1]];
}

console.log(endsOf([4, 8, 15], [16, 23, 42]));  // [4, 42]
