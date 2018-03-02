
function union() {
  function contains(array, element) {
    return array.indexOf(element) !== -1;
  }

  var result = [];
  var args = Array.prototype.slice.call(arguments);

  args.forEach(function (array) {
    array.forEach(function (a) {
      if (!contains(result, a)) result.push(a);
    });
  });

  return result;
}

console.log(union([1, 3, 5], [3, 6, 9, 6]));                 // [1, 3, 5, 6, 9]
console.log(union([1, 2], [3, 4], [1, 6, 2], [], [4], [9])); // [1, 2, 3, 4, 6, 9]
console.log(union([], [1], [1, 1]));                         // [1]
console.log(union());                                        // []
console.log(union([]));                                      // []
