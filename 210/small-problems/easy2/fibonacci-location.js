function findFibonacciIndexByLength(numberOfDigits) {
  var prevFibonacci1 = 1;
  var prevFibonacci2 = 1;
  var indexOfNextFibonacci = 3;
  var nextFibonacci;

  function roll() {
    nextFibonacci = prevFibonacci1 + prevFibonacci2;

    if (nextFibonacci >= Number.MAX_SAFE_INTEGER) {
      throw new Error('Cannot safely compute the next fibonacci number. Too big!');
    }

    if (String(nextFibonacci).length === numberOfDigits) {
      // console.log(nextFibonacci + ' @ ' + indexOfNextFibonacci);
      return indexOfNextFibonacci;
    }

    prevFibonacci1 = prevFibonacci2;
    prevFibonacci2 = nextFibonacci;
    indexOfNextFibonacci++;

    return roll();
  }

  return roll();
}

// Tests

console.log(findFibonacciIndexByLength(2) === 7);
console.log(findFibonacciIndexByLength(10) === 45);
console.log(findFibonacciIndexByLength(16) === 74);
findFibonacciIndexByLength(17);
