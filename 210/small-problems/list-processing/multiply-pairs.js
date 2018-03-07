function multiplyAllPairs(numbers1, numbers2) {
  var results = [];

  numbers1.forEach(function (n1) {
    numbers2.forEach(function (n2) {
      results.push(n1 * n2);
    });
  });

  return results.sort((n1, n2) => n1 - n2);
}

console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2])); // [2, 4, 4, 6, 8, 8, 12, 16]
