function halvsies(array) {
  var middle = Math.ceil(array.length / 2);
  var firstHalf  = array.slice(0, middle);
  var secondHalf = array.slice(middle);

  return [firstHalf, secondHalf];
}

console.log(halvsies([1, 2, 3, 4]));       // [[1, 2], [3, 4]]
console.log(halvsies([1, 5, 2, 4, 3]));    // [[1, 5, 2], [4, 3]]
console.log(halvsies([5]));                // [[5], []]
console.log(halvsies([]));                 // [[], []]
