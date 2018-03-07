// https://martinfowler.com/articles/collection-pipeline/#op-catalog

// difference

function difference(array1, array2) {
  return array1.filter(function (element) {
    return array2.indexOf(element) === -1;
  });
}

console.log(difference([1, 2, 3, 4, 5], [2, 5])); // [ 1, 3, 4 ]

// intersection

function intersection(array1, array2) {
  return array1.filter(function (element) {
    return array2.indexOf(element) !== -1;
  });
}

console.log(intersection([1, 2, 3, 4, 5], [2, 5, 6, 9])); // [ 2, 5 ]
console.log(intersection([1, 2, 3], [4, 5]));             // []

// union

function union(array1, array2) {
  return distinct(array1.concat(array2));
}

console.log(union([1, 2, 3], [4, 5])); // [1, 2, 3, 4, 5]

// distinct

function distinct(array) {
  var seen = {};

  return array.filter(function (element) {
    if (seen[element]) {
      return false;
    } else {
      seen[element] = true;
      return true;
    }
  });
}

console.log(distinct([1, 2, 1, 3, 4, 1, 3, 5, 4])); // [ 1, 2, 3, 4, 5 ]

// drop

function drop(array, n) {
  return array.slice(n);
}

console.log(drop([1, 2, 3, 4, 5], 2)); // [ 3, 4, 5 ]

// filter

// reject

function reject(array, func) {
  return array.filter(function (element) {
    return !func(element);
  });
}

console.log(reject([1, 2, 3, 4, 5, 6, 7, 8, 9], function (x) { return x % 2 == 0 }));

// flat-map and flatten

function flatMap(array, func) {
  return flatten(array.map(func));
}

function flatten(array) {
  var flattened = [];

  array.forEach(function (element) {
    if (Array.isArray(element)) {
      flattened = flattened.concat(flatten(element));
    } else {
      flattened.push(element);
    }
  });

  return flattened;
}

console.log(flatten([[1, 2], [3], [4, 5]]));       // [ 1, 2, 3, 4, 5 ]
console.log(flatten([[[1], 2], [[3], [4, [5]]]])); // [ 1, 2, 3, 4, 5 ]

// fold = inject = reduce

// group-by

function groupBy(array, func) {
  return array.reduce(function (groups, element) {
    var key = func(element);

    groups[key] = groups[key] || [];
    groups[key].push(element);

    return groups;
  }, {})
}

 console.log(groupBy(["bat", "it", "a", "the"], function (word) { return word.length; }));
// { '1': [ 'a' ], '2': [ 'it' ], '3': [ 'bat', 'the' ] }
