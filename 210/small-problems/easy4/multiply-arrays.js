function multiplyList(array1, array2) {
  var mult = [];
  var i;
  for (i = 0; i < array1.length; i += 1) {
    mult.push(array1[i] * array2[i]);
  }

  return mult;
}

function multiplyArrays(array1, array2) {
  return array1.map(function (a, i) {
    return a * array2[i];
  });
}

console.log(multiplyList([3, 5, 7], [9, 10, 11])); // [27, 50, 77]
console.log(multiplyArrays([3, 5, 7], [9, 10, 11])); // [27, 50, 77]
