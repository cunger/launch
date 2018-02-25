function concatTwoArrays(array1, array2) {
  var array = [];

  array.push(...array1);
  array.push(...array2);

  return array;
}

function concat(array, ...rest) {
  var combined = array.slice();

  rest.forEach(function (r) {
    if (Array.isArray(r)) {
      r.forEach(function (x) { combined.push(x); });
    } else {
      combined.push(r);
    }
  });

  return combined;
}

// Nick Johnson:
//
// function concat(arr, value) {
//   return Array.isArray(value) ? [...arr, ...value] : [...arr, value];
// }

// Examples

console.log(concat([1, 2, 3], [4, 5, 6]));          // [1, 2, 3, 4, 5, 6]
console.log(concat([1, 2], 3));                     // [1, 2, 3]
console.log(concat([2, 3], ['two', 'three']));      // [2, 3, "two", "three"]
console.log(concat([2, 3], 'four'));                // [2, 3, "four"]

var obj = { a: 2, b: 3 };
var newArray = concat([2, 3], obj);
console.log(newArray);                              // [2, 3, { a: 2, b: 3 }]
obj.a = 'two';
console.log(newArray);                              // [2, 3, { a: "two", b: 3 }]

var arr1 = [1, 2, 3];
var arr2 = [4, 5, obj];
var arr3 = concat(arr1, arr2);
console.log(arr3);                                  // [1, 2, 3, 4, 5, { a: "two", b: 3 }]
obj.b = 'three';
console.log(arr3);                                  // [1, 2, 3, 4, 5, { a: "two", b: "three" }]

arr3[5].b = 3;                                      // or, `arr3[5]['b'] = 3;`
console.log(obj);                                   // { a: "two", b: 3 }

console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9])); // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat([1, 2], 'a', ['one', 'two']));     // [1, 2, "a", "one", "two"]
console.log(concat([1, 2], ['three'], 4));            // [1, 2, "three", 4]
