function missing(numbers) {
  var start = numbers[0];
  var end = numbers[numbers.length - 1];
  var missing = [];

  var n;
  for (n = start + 1; n < end; n++) {
    if (!numbers.includes(n)) {
      missing.push(n);
    }
  }

  return missing;
}

console.log(missing([-3, -2, 1, 5])); // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));   // []
console.log(missing([1, 5]));         // [2, 3, 4]
console.log(missing([6]));            // []
