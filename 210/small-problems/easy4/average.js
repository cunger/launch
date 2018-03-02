function average(numbers) {
  var sum = numbers.reduce((n1, n2) => n1 + n2);
  var avg = sum / numbers.length;

  return Math.floor(avg);
}

console.log(average([1, 5, 87, 45, 8, 8]) === 25);
console.log(average([9, 47, 23, 95, 16, 52]) === 40);

// Multipicative average

function showMultiplicativeAverage(numbers) {
  var sum = numbers.reduce((n1, n2) => n1 * n2);
  var avg = sum / numbers.length;

  return String(avg.toFixed(3));
}

console.log(showMultiplicativeAverage([3, 5]) === "7.500");
console.log(showMultiplicativeAverage([2, 5, 7, 11, 13, 17]) === "28361.667");
