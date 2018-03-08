function sum(number) {
  return String(number)
    .split('')
    .map(char => Number(char))
    .reduce((sum, n) => sum + n);
}

console.log(sum(23) === 5);
console.log(sum(496) === 19);
console.log(sum(123456789) === 45);

function sumOfSums(numbers) {
  return numbers.reduce(function (acc, _, i, numbers) {
    return acc + numbers.slice(0, i + 1).reduce(function (sum, number) {
      return sum + number;
    }, 0)
  }, 0);
}

console.log(sumOfSums([3, 5, 2]));        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
console.log(sumOfSums([1, 5, 7, 3]));     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
console.log(sumOfSums([4]));              // 4
console.log(sumOfSums([1, 2, 3, 4, 5]));  // 35
console.log(sumOfSums([]));               // 0
