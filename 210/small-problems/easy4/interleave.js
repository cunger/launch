function interleave(array1, array2) {
  var result = [];
  var i;
  for (i = 0; i < array1.length; i += 1) {
    result.push(array1[i], array2[i]);
  }

  return result;
}

// Example

console.log(interleave([1, 2, 3], ['a', 'b', 'c'])); // [1, "a", 2, "b", 3, "c"]
