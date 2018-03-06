function octalToDecimal(octalString) {
  return octalString
             .split('')
             .map(char => Number(char))
             .reverse()
             .reduce((sum, digit, i) => sum + (digit * Math.pow(8, i)));
}

console.log(octalToDecimal('233') === 155);
console.log(octalToDecimal('1') === 1);
console.log(octalToDecimal('10') === 8);
console.log(octalToDecimal('130') === 88);
console.log(octalToDecimal('17') === 15);
console.log(octalToDecimal('2047') === 1063);
console.log(octalToDecimal('011') === 9);
