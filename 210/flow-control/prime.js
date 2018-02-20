// Inefficient prime number check

function isPrime(number) {
  if (number < 2) return false;

  var i;
  for (i = 2; i < number; i++) {
      if (number % i === 0) {
        return false;
      }
  }
  return true;
}

console.log(isPrime(1));
console.log(isPrime(2));
console.log(isPrime(3));
console.log(isPrime(43));
console.log(isPrime(55));
console.log(isPrime(0));
