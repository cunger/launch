function sum(number) {
  return String(number)
    .split('')
    .map(char => Number(char))
    .reduce((sum, n) => sum + n);
}

console.log(sum(23) === 5);
console.log(sum(496) === 19);
console.log(sum(123456789) === 45);
