function runningTotal(numbers) {
  var runningTotal = 0;
  var totals = [];

  numbers.forEach(function (number) {
    runningTotal += number;
    totals.push(runningTotal);
  });

  return totals;

  // var runningTotal = 0;
  // return numbers.map(function (number) {
  //   runningTotal += number;
  //   return runningTotal;
  // });
}

console.log(runningTotal([2, 5, 13]));             // [2, 7, 20]
console.log(runningTotal([14, 11, 7, 15, 20]));    // [14, 25, 32, 47, 67]
console.log(runningTotal([3]));                    // [3]
console.log(runningTotal([]));                     // []
