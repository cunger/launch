function average(numbers) {
  return sum(numbers) / numbers.length;
}

function sum(numbers) {
  var sum = 0;
  for (n in numbers) {
    sum += numbers[n];
  }
  return sum;
}

console.log(average([21.5, 23, 25.7, 23.2, 24]));
